class TimeResponse {
  int? code;
  String? status;
  Data? data;

  TimeResponse({this.code, this.status, this.data});

  factory TimeResponse.fromJson(Map<String, dynamic> json) => TimeResponse(
        code: json['code'] as int?,
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data?.toJson(),
      };
}

class Timings {
  String? fajr;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;

  Timings({
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json['Fajr'] as String?,
        dhuhr: json['Dhuhr'] as String?,
        asr: json['Asr'] as String?,
        maghrib: json['Maghrib'] as String?,
        isha: json['Isha'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Fajr': fajr,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Maghrib': maghrib,
        'Isha': isha,
      };
}

class Data {
  Timings? timings;
  Date? date;

  Data({
    this.timings,
    this.date,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        timings: json['timings'] == null
            ? null
            : Timings.fromJson(json['timings'] as Map<String, dynamic>),
        date: json['date'] == null
            ? null
            : Date.fromJson(json['date'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'timings': timings?.toJson(),
        'date': date?.toJson(),
      };
}

class Date {
  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  Date({this.readable, this.timestamp, this.hijri, this.gregorian});

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        readable: json['readable'] as String?,
        timestamp: json['timestamp'] as String?,
        hijri: json['hijri'] == null
            ? null
            : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
        gregorian: json['gregorian'] == null
            ? null
            : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'readable': readable,
        'timestamp': timestamp,
        'hijri': hijri?.toJson(),
        'gregorian': gregorian?.toJson(),
      };
}

class Gregorian {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  bool? lunarSighting;

  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.lunarSighting,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json['date'] as String?,
        format: json['format'] as String?,
        day: json['day'] as String?,
        weekday: json['weekday'] == null
            ? null
            : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
        month: json['month'] == null
            ? null
            : Month.fromJson(json['month'] as Map<String, dynamic>),
        year: json['year'] as String?,
        designation: json['designation'] == null
            ? null
            : Designation.fromJson(json['designation'] as Map<String, dynamic>),
        lunarSighting: json['lunarSighting'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'format': format,
        'day': day,
        'weekday': weekday?.toJson(),
        'month': month?.toJson(),
        'year': year,
        'designation': designation?.toJson(),
        'lunarSighting': lunarSighting,
      };
}

class Hijri {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  List<dynamic>? holidays;
  List<dynamic>? adjustedHolidays;
  String? method;

  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
    this.adjustedHolidays,
    this.method,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
        date: json['date'] as String?,
        format: json['format'] as String?,
        day: json['day'] as String?,
        weekday: json['weekday'] == null
            ? null
            : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
        month: json['month'] == null
            ? null
            : Month.fromJson(json['month'] as Map<String, dynamic>),
        year: json['year'] as String?,
        designation: json['designation'] == null
            ? null
            : Designation.fromJson(json['designation'] as Map<String, dynamic>),
        holidays: json['holidays'] as List<dynamic>?,
        adjustedHolidays: json['adjustedHolidays'] as List<dynamic>?,
        method: json['method'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'format': format,
        'day': day,
        'weekday': weekday?.toJson(),
        'month': month?.toJson(),
        'year': year,
        'designation': designation?.toJson(),
        'holidays': holidays,
        'adjustedHolidays': adjustedHolidays,
        'method': method,
      };
}

class Weekday {
  String? en;
  String? ar;

  Weekday({this.en, this.ar});

  factory Weekday.fromJson(Map<String, dynamic> json) => Weekday(
        en: json['en'] as String?,
        ar: json['ar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'ar': ar,
      };
}

class Month {
  int? number;
  String? en;
  String? ar;
  int? days;

  Month({this.number, this.en, this.ar, this.days});

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        number: json['number'] as int?,
        en: json['en'] as String?,
        ar: json['ar'] as String?,
        days: json['days'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'en': en,
        'ar': ar,
        'days': days,
      };
}

class Designation {
  String? abbreviated;
  String? expanded;

  Designation({this.abbreviated, this.expanded});

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: json['abbreviated'] as String?,
        expanded: json['expanded'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'abbreviated': abbreviated,
        'expanded': expanded,
      };
}
