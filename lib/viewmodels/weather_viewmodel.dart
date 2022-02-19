// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/data/weather_repository.dart';
import 'package:flutter_weatherapp/locator.dart';

import '../models/weather.dart';

enum WeatherState{
  InitialWeatherState,
  WeatherLoadingState,
  WeatherLoadedState, 
  WeatherErrorState
}

class WeatherViewModel with ChangeNotifier{
  late WeatherState _state;
  final WeatherRepository _repository = locator<WeatherRepository>();
  late Weather _getirilenWeather;

  WeatherViewModel(){
    _getirilenWeather = Weather();
    _state = WeatherState.InitialWeatherState;
  }
  
  Weather get getirilenWeather => _getirilenWeather;
  

  WeatherState get state => _state;

  set state(WeatherState value){
    _state = value;
    notifyListeners();
  }

  Future<Weather> havaDurumunuGetir(String sehirAdi) async{
    try {
      state=WeatherState.WeatherLoadingState;
      _getirilenWeather = await _repository.getWeather(sehirAdi);
      state = WeatherState.WeatherLoadedState;
      

    } catch (e) {
      state = WeatherState.WeatherErrorState;
      
    }
    return _getirilenWeather;
  }

  Future<Weather> havaDurumunuGuncelle(String sehirAdi) async{
    try {
      _getirilenWeather = await _repository.getWeather(sehirAdi);
      state = WeatherState.WeatherLoadedState;
      
    // ignore: empty_catches
    } catch (e) {}
    return _getirilenWeather;
  }

  String havaDurumuKisaltmasi(){
    return getirilenWeather.consolidatedWeather![0].weatherStateAbbr!;
  }
}