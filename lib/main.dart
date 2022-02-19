import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/locator.dart';
import 'package:flutter_weatherapp/viewmodels/mytheme_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weatherapp/viewmodels/weather_viewmodel.dart';

import 'widgets/weather_app.dart';

void main() {
  setupLocator();
  runApp(
    ChangeNotifierProvider(
        create: (context) => MyThemeViewModel(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeViewModel>(
      builder: (context, myThemeVM, child) => MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: myThemeVM.myTheme.tema,
        home: ChangeNotifierProvider<WeatherViewModel>(
          create: (context) => locator<WeatherViewModel>(),
          child: WeatherApp(),
        ),
      ),
    );
  }
}
