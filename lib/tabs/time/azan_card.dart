import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/time_response/time_response.dart';
import 'package:islami_app/tabs/time/azan_time_iteme.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/asset_manegment.dart';

class AzanCard extends StatelessWidget {
  const AzanCard({super.key, required this.timeData});
  final TimeResponse timeData;

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(AssetManegment.timeCard),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.065, vertical: screenHight * 0.007),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      timeData.data!.date!.readable ?? "",
                      textAlign: TextAlign.start,
                      style: AppStyle.boldwhite16,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(
                          "Pray Time",
                          style: AppStyle.boldblackWithOpacity7120,
                          textAlign: TextAlign.center,
                        ),
                        AutoSizeText(
                          timeData.data!.date!.hijri!.weekday!.ar ?? '',
                          style: AppStyle.boldblackWithOpacity9020
                              .copyWith(fontSize: 24),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "${timeData.data!.date!.hijri!.day ?? ""} ${timeData.data!.date!.hijri!.month!.en!.substring(0, 3)} ${timeData.data!.date!.hijri!.year ?? ""}",
                      textAlign: TextAlign.center,
                      style: AppStyle.boldwhite16,
                    ),
                  ),
                ],
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: screenHight * 0.22,
                  viewportFraction: 0.36,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.28,
                ),
                itemCount: timeData.data!.timings?.toJson().length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        AzanTimeIteme(
                  azanName: timeData.data!.timings
                          ?.toJson()
                          .keys
                          .elementAt(itemIndex) ??
                      '',
                  azanTime: timeData.data!.timings
                          ?.toJson()
                          .values
                          .elementAt(itemIndex) ??
                      '',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
