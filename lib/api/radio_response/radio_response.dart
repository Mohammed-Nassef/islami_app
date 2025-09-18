class RadioResponse {
  List<Radio>? radios;

  RadioResponse({this.radios});

  factory RadioResponse.fromJson(Map<String, dynamic> json) => RadioResponse(
        radios: (json['radios'] as List<dynamic>?)
            ?.map((e) => Radio.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'radios': radios?.map((e) => e.toJson()).toList(),
      };
}

class Radio {
  int? id;
  String? name;
  String? url;
  String? recentDate;

  Radio({this.id, this.name, this.url, this.recentDate});

  factory Radio.fromJson(Map<String, dynamic> json) => Radio(
        id: json['id'] as int?,
        name: json['name'] as String?,
        url: json['url'] as String?,
        recentDate: json['recent_date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'url': url,
        'recent_date': recentDate,
      };
}
