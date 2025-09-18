import 'package:flutter/material.dart';
import 'package:islami_app/api/api_manager/api_manager.dart';
import 'package:islami_app/api/radio_response/radio_response.dart';

import 'package:islami_app/tabs/radio/radio_and_rectrict_card.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHight * 0.6,
      child: FutureBuilder<RadioResponse>(
        future: ApiManager.getRadios(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    AppColor.primaryColor, BlendMode.srcIn),
                child: Image.asset("assets/icon/Loading.gif"),
              ),
            );
          } else if (snapShot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Some Thing Is Wrong",
                  style: AppStyle.boldPrimarycolor20,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      foregroundColor: AppColor.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      ApiManager.getRadios();
                      setState(() {});
                    },
                    child: Text(
                      "Try agin",
                      style: AppStyle.boldBlack16,
                    ))
              ],
            );
          }
          var listRadio = snapShot.data!.radios ?? [];
          return ListView.separated(
            padding: EdgeInsets.only(bottom: screenHight * 0.015),
            separatorBuilder: (context, index) => SizedBox(
              height: screenHight * 0.012,
            ),
            itemBuilder: (context, index) {
              return RadioAndRectrictCard(
                audio: "${listRadio[index].url!}.wav",
                text: listRadio[index].name ?? '',
              );
            },
            itemCount: listRadio.length,
          );
        },
      ),
    );
  }
}
