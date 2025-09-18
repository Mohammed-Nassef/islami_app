import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/asset_manegment.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
  });
  final String hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: AppStyle.boldwhite16,
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(
            AssetManegment.quran,
            height: 24,
            width: 24,
            colorFilter:
                const ColorFilter.mode(AppColor.primaryColor, BlendMode.srcIn),
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
