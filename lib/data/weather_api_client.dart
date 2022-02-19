import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_weatherapp/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com/';
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final sehirUrl = baseUrl + '/api/location/search/?query=' + sehirAdi;
    final gelenCevap = await httpClient.get(Uri.parse(sehirUrl));
    debugPrint('deneme' + gelenCevap.body);

    if (gelenCevap.statusCode != 200) {
      throw Exception('Veri Getirilemedi...');
    }
    debugPrint('burada');
    int data = gelenCevap.body.indexOf('woeid');
    debugPrint(data.toString());
    String data2 = gelenCevap.body.substring(data);
    debugPrint(data2);
    int index = data2.indexOf(':');
    int index2 = data2.indexOf(',');
    String data3 = data2.substring(index + 1, index2);
    debugPrint(data3);

    /* List gelenCevapJSON = (json.decode(gelenCevap.body)) as List<dynamic> ;
    debugPrint('deneme' + gelenCevapJSON[0]['woeid']);
    return int.parse(gelenCevapJSON[0]["woeid"]); */
    return int.parse(data3);
  }

  Future<Weather> getWeather(int sehirID) async {
    debugPrint(sehirID.toString());
    final havaDurumuUrl = baseUrl + 'api/location/$sehirID';
    debugPrint(havaDurumuUrl);
    final havaDurumuGelenCevap = await httpClient.get(Uri.parse(havaDurumuUrl));
    debugPrint(havaDurumuGelenCevap.body);

    if (havaDurumuGelenCevap.statusCode != 200) {
      debugPrint('hava durumu getirilemedi');
      throw Exception('Hava Durumu Getirilemedi...');
    }
    debugPrint('debug burda');

    var havaDurumuCevapJSON =
        (json.decode(havaDurumuGelenCevap.body)) as Map<String, dynamic>;
    debugPrint('şimdiburda...');
    return Weather.fromJson(havaDurumuCevapJSON);
  }
}
