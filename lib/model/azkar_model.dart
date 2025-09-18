import 'package:islami_app/utils/asset_manegment.dart';

class AzkarModel {
  String azkarImage;
  String azkarName;
  AzkarModel({required this.azkarImage, required this.azkarName});
  static List<AzkarModel> azKarList = [
    AzkarModel(
        azkarImage: AssetManegment.sleepingAzkar, azkarName: "Sleeping Azkar"),
    AzkarModel(
        azkarImage: AssetManegment.walkingazkar, azkarName: "Walking Azkar"),
    AzkarModel(
        azkarImage: AssetManegment.eveningAzkar, azkarName: "Evening Azkar"),
    AzkarModel(
        azkarImage: AssetManegment.morningAzkar, azkarName: "Morning Azkar"),
  ];
}
