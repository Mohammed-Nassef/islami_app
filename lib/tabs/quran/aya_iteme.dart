import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class AyaIteme extends StatefulWidget {
  const AyaIteme({super.key, required this.index, required this.suraList});
  final int index;
  final List<String> suraList;

  @override
  State<AyaIteme> createState() => _AyaItemeState();
}

class _AyaItemeState extends State<AyaIteme> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        isSelected = !isSelected;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : AppColor.black,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColor.primaryColor,
            width: 1,
          ),
        ),
        child: Text(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          "[${widget.index + 1}]  ${widget.suraList[widget.index]}",
          style:
              isSelected ? AppStyle.boldBlack20 : AppStyle.boldPrimarycolor20,
        ),
      ),
    );
  }
}
