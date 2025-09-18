import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/utils/app_color.dart';

class ActiveIconWidget extends StatelessWidget {
  final String activeIconPath;
  const ActiveIconWidget({super.key, required this.activeIconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.blackWithOpacity60,
        borderRadius: BorderRadius.circular(66),
      ),
      child: SvgPicture.asset(
        activeIconPath,
        height: 27,
        width: 27,
        fit: BoxFit.scaleDown,
        colorFilter: const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
      ),
    );
  }
}
