import 'package:flutter/material.dart';
import 'package:islami_app/api/api_manager/api_manager.dart';
import 'package:islami_app/api/rectires_response/rectires_response.dart';
import 'package:islami_app/tabs/radio/rectirs_name_card.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class RectrictScreen extends StatefulWidget {
  const RectrictScreen({super.key});

  @override
  State<RectrictScreen> createState() => _RectrictScreenState();
}

class _RectrictScreenState extends State<RectrictScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHight * 0.6,
      child: FutureBuilder<RectiresResponse>(
        future: ApiManager.getReciters(),
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
                      ApiManager.getReciters();
                      setState(() {});
                    },
                    child: Text(
                      "Try agin",
                      style: AppStyle.boldBlack16,
                    ))
              ],
            );
          }
          RectiresResponse? rectirsData = snapShot.data;
          return ListView.separated(
            padding: EdgeInsets.only(bottom: screenHight * 0.015),
            separatorBuilder: (context, index) => SizedBox(
              height: screenHight * 0.012,
            ),
            itemBuilder: (context, index) {
              return (RectirsNameCard(
                text: rectirsData.reciters![index],
              ));
            },
            itemCount: rectirsData!.reciters!.length,
          );
        },
      ),
    );
  }
}
