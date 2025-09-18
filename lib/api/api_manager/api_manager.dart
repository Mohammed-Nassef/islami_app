import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/api/api_constant.dart';
import 'package:islami_app/api/radio_response/radio_response.dart';
import 'package:islami_app/api/rectires_response/rectires_response.dart';
import 'package:islami_app/api/time_response/time_response.dart';

class ApiManager {
  static Future<RectiresResponse> getReciters() async {
    Uri url = Uri.https(
      ApiConstant.reciterServerName,
      ApiConstant.reciterEndpoint,
      {"language": "ar"},
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return RectiresResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<RadioResponse> getRadios() async {
    Uri url = Uri.https(
      ApiConstant.radioServerName,
      ApiConstant.radioEndpoint,
      {"language": "ar"},
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return RadioResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<TimeResponse> getTimePray() async {
    Uri urL = Uri.https(
      ApiConstant.timeServerName,
      ApiConstant.timeEndpoint,
      {'city': ApiConstant.city, 'country': ApiConstant.country},
    );
    try {
      var response = await http.get(urL);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return TimeResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
