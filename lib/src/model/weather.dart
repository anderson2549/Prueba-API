import 'dart:convert';

class ListWeathers {
  ListWeathers();
  List<Weather> getList() => [];

  List<Weather> listado = [];

  factory ListWeathers.fromJson(String str) {
    return ListWeathers.fromMap(json.decode(str));
  }

  String toJson() => json.encode(toMap());

  factory ListWeathers.fromMap(Map<String, dynamic> json) {
    var obj = ListWeathers();

    obj.listado =
        List<Weather>.from(json["listado"].map((x) => Weather.fromMap(x)));
    return obj;
  }

  Map<String, dynamic> toMap() => {
        "listado": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Weather {
  Weather({
    this.title = "",
    this.locationType = "",
    this.woeid = 0,
    this.lattLong = "",
  });

  String title;
  String locationType;
  int woeid;
  String lattLong;

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
      };
}
