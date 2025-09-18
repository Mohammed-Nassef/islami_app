import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class AzanTimeIteme extends StatelessWidget {
  const AzanTimeIteme(
      {super.key, required this.azanName, required this.azanTime});
  final String azanName;
  final String azanTime;

  @override
  Widget build(BuildContext context) {
    DateTime parsedTime = DateFormat("HH:mm").parse(azanTime);
    String formattedTime = DateFormat("hh:mm a").format(parsedTime);
    double screenHight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: screenHight * 0.025),
      padding:
          EdgeInsets.symmetric(horizontal: 9, vertical: screenHight * 0.025),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [
          AppColor.black,
          AppColor.primaryColor,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        children: [
          AutoSizeText(
            azanName,
            style: AppStyle.boldwhite20,
          ),
          Expanded(
            child: AutoSizeText(
              formattedTime,
              textAlign: TextAlign.center,
              style: AppStyle.boldwhite32,
            ),
          ),
        ],
      ),
    );
  }
}
