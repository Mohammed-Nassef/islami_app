import 'package:islami_app/utils/asset_manegment.dart';

class OnbordingModel {
  String image;
  String body1;
  String? body2;
  OnbordingModel({required this.image, required this.body1, this.body2});
  static List<OnbordingModel> onbordingList = [
    OnbordingModel(
      image: AssetManegment.onbordaing1,
      body1: "Welcome To Islmi App",
    ),
    OnbordingModel(
      image: AssetManegment.onbordaing2,
      body1: "Welcome To Islmi",
      body2: "We Are Very Excited To Have You In Our Community",
    ),
    OnbordingModel(
      image: AssetManegment.onbordaing3,
      body1: "Reading the Quran",
      body2: "Read, and your Lord is the Most Generous",
    ),
    OnbordingModel(
      image: AssetManegment.onbordaing4,
      body1: "Bearish",
      body2: "Praise the name of your Lord, the Most High",
    ),
    OnbordingModel(
      image: AssetManegment.onbordaing5,
      body1: "Holy Quran Radio",
      body2:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
