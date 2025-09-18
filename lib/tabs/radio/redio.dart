import 'package:flutter/material.dart';
import 'package:islami_app/tabs/radio/radio_screen.dart';
import 'package:islami_app/tabs/radio/rectrict_screen.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Redio extends StatefulWidget {
  const Redio({super.key});

  @override
  State<Redio> createState() => _RedioState();
}

class _RedioState extends State<Redio> {
  int activeIndex = 0;
  @override
  build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: screenHight * 0.011),
            child: ToggleSwitch(
              minHeight: screenHight * 0.048,
              minWidth: screenWidth * 0.5,
              cornerRadius: 12,
              activeBgColors: const [
                [AppColor.primaryColor],
                [AppColor.primaryColor],
              ],
              activeFgColor: AppColor.black,
              inactiveBgColor: AppColor.blackWithOpacity70,
              inactiveFgColor: AppColor.white,
              initialLabelIndex: activeIndex,
              totalSwitches: 2,
              labels: const ['Radio', 'Reciters'],
              fontSize: 16,
              radiusStyle: true,
              onToggle: (index) {
                setState(() {
                  activeIndex = index!;
                });
              },
            ),
          ),
          change(activeIndex),
        ],
      ),
    );
  }

  Widget change(int index) {
    return index == 0 ? const RadioScreen() : const RectrictScreen();
  }
}
