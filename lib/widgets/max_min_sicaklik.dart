import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/models/weather.dart';

// ignore: must_be_immutable
class MaxveMinSicaklikWidget extends StatelessWidget {
  MaxveMinSicaklikWidget({required this.bugununDegerleri, Key? key}) : super(key: key);
  ConsolidatedWeather bugununDegerleri;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Maksimum: ' + bugununDegerleri.maxTemp!.floor().toString() + '°C',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Minimum: ' + bugununDegerleri.minTemp!.floor().toString() + '°C',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
