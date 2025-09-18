import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static bool isFirstRun = false;
  static savedOnbording(bool isFirstRun) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstRun', isFirstRun);
  }

  static Future<bool?> getOnbording() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstRun = prefs.getBool('isFirstRun');

    return isFirstRun ?? false;
  }
}
