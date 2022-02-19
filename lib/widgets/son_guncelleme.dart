import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/viewmodels/weather_viewmodel.dart';
import 'package:provider/provider.dart';

class SonGuncellemeWidget extends StatelessWidget {
  const SonGuncellemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var yeniTarih =
        DateTime.tryParse(_weatherViewModel.getirilenWeather.time!)!.toLocal();

    return Text(
      'Son Güncelleme ' + TimeOfDay.fromDateTime(yeniTarih).format(context),
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    );
  }
}
