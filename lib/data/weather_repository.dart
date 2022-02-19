import 'package:flutter/cupertino.dart';
import 'package:flutter_weatherapp/data/weather_api_client.dart';
import 'package:flutter_weatherapp/locator.dart';
import 'package:flutter_weatherapp/models/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String sehir) async {
    final int sehirID = await weatherApiClient.getLocationID(sehir);
    debugPrint('Sehir id:' + sehirID.toString());
    return await weatherApiClient.getWeather(sehirID);
  }
}
