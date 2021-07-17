import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:prueba_flutter/src/model/DetailsWeather.dart';
import 'package:prueba_flutter/src/model/weather.dart';

class ClimaProvider extends ChangeNotifier {
  String _url = "www.metaweather.com";
//String _url="";

  ClimaProvider() {
    print("Creacion del provider");
  }
  Future<List<Weather>> getClimaSugerencia(String search) async {
    var url = Uri.https(_url, "api/location/search/", {"query": search});
    final respuesta = await http.get(url);
    // ignore: unnecessary_null_comparison
    if (respuesta == null) {
      return [];
    }

    final weathers =
        ListWeathers.fromJson('{"listado":' + respuesta.body + "}");
    //final weather = weatherFromMap(jsonString);

    return weathers.listado;
  }

  //https://www.metaweather.com/api/location/2487956/

  Future<DetailsWeather> getClimaDetalle(int woeid) async {
    var url = Uri.https(_url, "/api/location/$woeid/");
    final respuesta = await http.get(url);

    final weathers = DetailsWeather.fromJson(respuesta.body);
    //final weather = weatherFromMap(jsonString);

    return weathers;
  }
}
