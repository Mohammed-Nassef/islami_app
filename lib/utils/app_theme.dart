import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class AppTheme {
  static ThemeData lighTheme = ThemeData(
    appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        titleTextStyle: AppStyle.boldPrimarycolor20,
        backgroundColor: AppColor.black,
        centerTitle: true,
        foregroundColor: AppColor.primaryColor),
    scaffoldBackgroundColor: AppColor.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.primaryColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle: AppStyle.boldwhite12,
      selectedItemColor: AppColor.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.blackWithOpacity70,
      hintStyle: AppStyle.boldwhite16,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 1, color: AppColor.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 1, color: AppColor.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 1, color: AppColor.primaryColor),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
