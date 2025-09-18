import 'package:intl/intl.dart';

class ApiConstant {
  static String date = DateFormat('d-MM-yyyy').format(DateTime.now());
  static String reciterServerName = 'www.mp3quran.net';
  static String reciterEndpoint = '/api/v3/reciters';
  static String radioServerName = 'www.mp3quran.net';
  static String radioEndpoint = '/api/v3/radios';
  static String timeServerName = 'api.aladhan.com';
  static String timeEndpoint = '//v1/timingsByCity/$date';
  static String city = 'cairo';
  static String country = 'egypt';
}
