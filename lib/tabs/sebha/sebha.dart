import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/asset_manegment.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  double angle = 0;
  int counter = 0;
  String zikr = "سبحان الله";
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.022, horizontal: screenWidth * 0.022),
      child: Column(
        children: [
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: AppStyle.boldwhite36,
          ),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          Column(
            children: [
              Image.asset(
                AssetManegment.headersebha,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.42,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: InkWell(
                        onTap: () {
                          angle += 0.1;
                          changeZikr(counter);
                          if (counter == 99) {
                            counter = 0;
                          }

                          counter++;
                          setState(() {});
                        },
                        child: Transform.rotate(
                          angle: angle,
                          child: Image.asset(
                            AssetManegment.bodysebha,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Spacer(),
                        Text(
                          zikr,
                          style: AppStyle.boldwhite36,
                        ),
                        SizedBox(
                          height: screenHeight * 0.022,
                        ),
                        Text(
                          "$counter",
                          style: AppStyle.boldwhite36,
                        ),
                        const Spacer(),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void changeZikr(int counter) {
    if (counter < 33) {
      zikr = "سبحان الله";
    } else if (counter < 66) {
      zikr = "الحمد لله";
    } else if (counter < 99) {
      zikr = "الله أكبر";
    } else {
      zikr = "سبحان الله";
    }
  }
}
