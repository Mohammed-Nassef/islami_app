import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/tabs/sebha/sebha.dart';
import 'package:islami_app/widget/active_icon_widget.dart';
import 'package:islami_app/tabs/hadeeth/hadeeth.dart';
import 'package:islami_app/tabs/quran/quran.dart';
import 'package:islami_app/tabs/radio/redio.dart';
import 'package:islami_app/tabs/time/time.dart';
import 'package:islami_app/utils/asset_manegment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> tabs = [
    const Quran(),
    const Hadeeth(),
    const Sebha(),
    const Redio(),
    const Time(),
  ];

  final List<String> backgroundImage = [
    AssetManegment.quranbackground,
    AssetManegment.hadeethbackground,
    AssetManegment.sebhabackground,
    AssetManegment.radiobackground,
    AssetManegment.timebackground,
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                backgroundImage[activeIndex],
              ),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Image.asset(AssetManegment.header),
                tabs[activeIndex],
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: activeIndex,
      onTap: (index) {
        activeIndex = index;
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetManegment.quran,
            height: 24,
            width: 24,
            fit: BoxFit.scaleDown,
          ),
          activeIcon: ActiveIconWidget(
            activeIconPath: AssetManegment.quran,
          ),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetManegment.hadeeth,
            height: 24,
            width: 24,
            fit: BoxFit.scaleDown,
          ),
          activeIcon: ActiveIconWidget(
            activeIconPath: AssetManegment.hadeeth,
          ),
          label: "Hadeeth",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetManegment.sibha,
            height: 24,
            width: 24,
            fit: BoxFit.scaleDown,
          ),
          activeIcon: ActiveIconWidget(
            activeIconPath: AssetManegment.sibha,
          ),
          label: "Sibha",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetManegment.radio,
            height: 24,
            width: 24,
            fit: BoxFit.scaleDown,
          ),
          activeIcon: ActiveIconWidget(
            activeIconPath: AssetManegment.radio,
          ),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetManegment.time,
            height: 24,
            width: 24,
            fit: BoxFit.scaleDown,
          ),
          activeIcon: ActiveIconWidget(
            activeIconPath: AssetManegment.time,
          ),
          label: "Time",
        ),
      ],
    );
  }
}
