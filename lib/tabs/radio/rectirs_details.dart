import 'package:flutter/material.dart';
import 'package:islami_app/api/rectires_response/rectires_response.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/tabs/radio/radio_and_rectrict_card.dart';

class RectirsDetails extends StatelessWidget {
  const RectirsDetails({super.key});
  static String routeName = "RectirsDetails";

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    var arg = ModalRoute.of(context)!.settings.arguments as Reciter;
    return Scaffold(
      appBar: AppBar(
        title: Text(arg.name ?? ""),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHight * 0.015),
        child: ListView.separated(
          padding: EdgeInsets.all(screenHight * 0.015),
          separatorBuilder: (context, index) => SizedBox(
            height: screenHight * 0.012,
          ),
          itemBuilder: (context, index) {
            int numSura = index + 1;
            final suraCode = numSura.toString().padLeft(3, '0');
            return RadioAndRectrictCard(
              audio: "${arg.moshaf![0].server!}$suraCode.mp3",
              text: SuraModel.arabicSurasName[index],
            );
          },
          itemCount: SuraModel.arabicSurasName.length,
        ),
      ),
    );
  }
}
