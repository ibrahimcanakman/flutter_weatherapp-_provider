import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weatherapp/viewmodels/weather_viewmodel.dart';

class HavaDurumuResimWidget extends StatelessWidget {
  const HavaDurumuResimWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var _havaDurumuKisaltmasi = _weatherViewModel
        .getirilenWeather.consolidatedWeather![0].weatherStateAbbr
        .toString();

    return Column(
      children: [
        Text(
          _weatherViewModel.getirilenWeather.consolidatedWeather![0].theTemp!
                  .floor()
                  .toString() +
              '°C',
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        Image.network(
          'https://www.metaweather.com/static/img/weather/png/' +
              _havaDurumuKisaltmasi +
              '.png',
          height: 200,
          width: 200,
        )
      ],
    );
  }
}
