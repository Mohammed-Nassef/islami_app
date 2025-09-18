import 'package:flutter/material.dart';
import 'package:islami_app/model/onbording_model.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:islami_app/utils/asset_manegment.dart';

class OnbordingIteme extends StatelessWidget {
  const OnbordingIteme({super.key, required this.onbordingmodel});
  final OnbordingModel onbordingmodel;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Image.asset(
            height: screenHeight * 0.25,
            width: double.infinity,
            AssetManegment.header,
          ),
          Image.asset(
            onbordingmodel.image,
            height: screenHeight * 0.37,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                onbordingmodel.body1,
                style: AppStyle.boldPrimarycolor24,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                textAlign: TextAlign.center,
                onbordingmodel.body2 ?? '',
                style: AppStyle.boldPrimarycolor20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
