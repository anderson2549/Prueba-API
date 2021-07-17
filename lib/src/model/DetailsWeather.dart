// To parse this JSON data, do
//
//     final detailsWeather = detailsWeatherFromMap(jsonString);

import 'dart:convert';

class DetailsWeather {
  DetailsWeather({
    required this.consolidatedWeather,
    required this.time,
    required this.sunRise,
    required this.sunSet,
    required this.timezoneName,
    required this.parent,
    required this.sources,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
    required this.timezone,
  });

  List<ConsolidatedWeather> consolidatedWeather;
  DateTime time;
  DateTime sunRise;
  DateTime sunSet;
  String timezoneName;
  Parent parent;
  List<Source> sources;
  String title;
  String locationType;
  int woeid;
  String lattLong;
  String timezone;

  factory DetailsWeather.fromJson(String str) =>
      DetailsWeather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailsWeather.fromMap(Map<String, dynamic> json) => DetailsWeather(
        consolidatedWeather: List<ConsolidatedWeather>.from(
            json["consolidated_weather"]
                .map((x) => ConsolidatedWeather.fromMap(x))),
        time: DateTime.parse(json["time"]),
        sunRise: DateTime.parse(json["sun_rise"]),
        sunSet: DateTime.parse(json["sun_set"]),
        timezoneName: json["timezone_name"],
        parent: Parent.fromMap(json["parent"]),
        sources:
            List<Source>.from(json["sources"].map((x) => Source.fromMap(x))),
        title: json["title"],
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toMap() => {
        "consolidated_weather":
            List<dynamic>.from(consolidatedWeather.map((x) => x.toMap())),
        "time": time.toIso8601String(),
        "sun_rise": sunRise.toIso8601String(),
        "sun_set": sunSet.toIso8601String(),
        "timezone_name": timezoneName,
        "parent": parent.toMap(),
        "sources": List<dynamic>.from(sources.map((x) => x.toMap())),
        "title": title,
        "location_type": locationType,
        "woeid": woeid,
        "latt_long": lattLong,
        "timezone": timezone,
      };
}

class ConsolidatedWeather {
  ConsolidatedWeather({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  int id;
  String weatherStateName;
  String weatherStateAbbr;
  String windDirectionCompass;
  DateTime created;
  DateTime applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;
  double windSpeed;
  double windDirection;
  double airPressure;
  int humidity;
  double visibility;
  int predictability;

  factory ConsolidatedWeather.fromJson(String str) =>
      ConsolidatedWeather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConsolidatedWeather.fromMap(Map<String, dynamic> json) =>
      ConsolidatedWeather(
        id: json["id"],
        weatherStateName: json["weather_state_name"],
        weatherStateAbbr: json["weather_state_abbr"],
        windDirectionCompass: json["wind_direction_compass"],
        created: DateTime.parse(json["created"]),
        applicableDate: DateTime.parse(json["applicable_date"]),
        minTemp: json["min_temp"].toDouble(),
        maxTemp: json["max_temp"].toDouble(),
        theTemp: json["the_temp"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDirection: json["wind_direction"].toDouble(),
        airPressure: json["air_pressure"].toDouble(),
        humidity: json["humidity"],
        visibility: json["visibility"].toDouble(),
        predictability: json["predictability"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "weather_state_name": weatherStateName,
        "weather_state_abbr": weatherStateAbbr,
        "wind_direction_compass": windDirectionCompass,
        "created": created.toIso8601String(),
        "applicable_date":
            "${applicableDate.year.toString().padLeft(4, '0')}-${applicableDate.month.toString().padLeft(2, '0')}-${applicableDate.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
      };
}

class Parent {
  Parent({
    this.title = "",
    this.locationType = "",
    this.woeid = 0,
    this.lattLong = "",
  });

  String title;
  String locationType;
  int woeid;
  String lattLong;

  factory Parent.fromJson(String str) => Parent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parent.fromMap(Map<String, dynamic> json) => Parent(
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

class Source {
  Source({
    this.title = "",
    this.slug = "",
    this.url = "",
    this.crawlRate = 0,
  });

  String title;
  String slug;
  String url;
  int crawlRate;

  factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        title: json["title"],
        slug: json["slug"],
        url: json["url"],
        crawlRate: json["crawl_rate"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "slug": slug,
        "url": url,
        "crawl_rate": crawlRate,
      };
}
