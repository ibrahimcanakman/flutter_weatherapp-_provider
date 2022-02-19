import 'package:flutter_weatherapp/data/weather_api_client.dart';
import 'package:flutter_weatherapp/data/weather_repository.dart';
import 'package:flutter_weatherapp/viewmodels/weather_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
  locator.registerFactory(() => WeatherViewModel());
}