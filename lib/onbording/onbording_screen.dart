import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/model/onbording_model.dart';
import 'package:islami_app/onbording/onbording_iteme.dart';
import 'package:islami_app/shared.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});
  static String routeName = "/OnbordingScreen";

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  void initState() {
    super.initState();
    Shared.isFirstRun = true;
    Shared.savedOnbording(Shared.isFirstRun);
  }

  int activeIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  activeIndex = value;
                  setState(() {});
                },
                itemBuilder: (context, index) => OnbordingIteme(
                  onbordingmodel: OnbordingModel.onbordingList[index],
                ),
                itemCount: OnbordingModel.onbordingList.length,
              ),
            ),
            Row(
              children: [
                Visibility(
                  visible: activeIndex != 0,
                  replacement: const Spacer(),
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      overlayColor: AppColor.black,
                    ),
                    onPressed: () {
                      controller.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                      activeIndex--;
                    },
                    child: Text(
                      "Back",
                      style: AppStyle.boldPrimarycolor16,
                    ),
                  ),
                ),
                const Spacer(),
                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: OnbordingModel.onbordingList.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: AppColor.primaryColor,
                      dotColor: AppColor.gray,
                      dotHeight: 10,
                      spacing: 12,
                      dotWidth: 10),
                ),
                const Spacer(),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    overlayColor: AppColor.black,
                  ),
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                    activeIndex++;
                    if (activeIndex == OnbordingModel.onbordingList.length) {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName);
                    }
                  },
                  child: Text(
                    activeIndex == OnbordingModel.onbordingList.length - 1
                        ? "Finish"
                        : "Next",
                    style: AppStyle.boldPrimarycolor16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
