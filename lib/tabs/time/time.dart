import 'package:flutter/material.dart';
import 'package:islami_app/api/api_manager/api_manager.dart';
import 'package:islami_app/api/time_response/time_response.dart';
import 'package:islami_app/tabs/time/azan_card.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;

    return FutureBuilder<TimeResponse>(
        future: ApiManager.getTimePray(),
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
          } else if (snapShot.data!.status != "OK") {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Some Thing Is Wrong In Server ",
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
          TimeResponse timeData = snapShot.data!;
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 15, vertical: screenHight * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AzanCard(timeData: timeData),
              ],
            ),
          );
        });
  }
}
