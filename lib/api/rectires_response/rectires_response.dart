class RectiresResponse {
  List<Reciter>? reciters;

  RectiresResponse({this.reciters});

  factory RectiresResponse.fromJson(Map<String, dynamic> json) {
    return RectiresResponse(
      reciters: (json['reciters'] as List<dynamic>?)
          ?.map((e) => Reciter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'reciters': reciters?.map((e) => e.toJson()).toList(),
      };
}

class Reciter {
  int? id;
  String? name;
  String? letter;
  DateTime? date;
  List<Moshaf>? moshaf;

  Reciter({this.id, this.name, this.letter, this.date, this.moshaf});

  factory Reciter.fromJson(Map<String, dynamic> json) => Reciter(
        id: json['id'] as int?,
        name: json['name'] as String?,
        letter: json['letter'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        moshaf: (json['moshaf'] as List<dynamic>?)
            ?.map((e) => Moshaf.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'letter': letter,
        'date': date?.toIso8601String(),
        'moshaf': moshaf?.map((e) => e.toJson()).toList(),
      };
}

class Moshaf {
  int? id;
  String? name;
  String? server;
  int? surahTotal;
  int? moshafType;
  String? surahList;

  Moshaf({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) => Moshaf(
        id: json['id'] as int?,
        name: json['name'] as String?,
        server: json['server'] as String?,
        surahTotal: json['surah_total'] as int?,
        moshafType: json['moshaf_type'] as int?,
        surahList: json['surah_list'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'server': server,
        'surah_total': surahTotal,
        'moshaf_type': moshafType,
        'surah_list': surahList,
      };
}
