import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/viewmodels/mytheme_viewmodel.dart';
import 'package:flutter_weatherapp/viewmodels/weather_viewmodel.dart';
import 'package:flutter_weatherapp/widgets/gecisli_arkaplan_renk.dart';
import 'package:flutter_weatherapp/widgets/sehir_sec.dart';
import 'package:provider/provider.dart';

import 'hava_durumu_resim.dart';
import 'location.dart';
import 'max_min_sicaklik.dart';
import 'son_guncelleme.dart';

// ignore: must_be_immutable
class WeatherApp extends StatelessWidget {
  String? kullanicininSectigiSehir = '';

  WeatherApp({Key? key}) : super(key: key);

  late WeatherViewModel _weatherViewModel;

  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Provider.of<MyThemeViewModel>(context).myTheme.renk,
          elevation: 0,
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () async {
                  kullanicininSectigiSehir = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SehirSecWidget(),
                      ));
                  _weatherViewModel
                      .havaDurumunuGetir(kullanicininSectigiSehir!);
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Center(
          child: (_weatherViewModel.state == WeatherState.WeatherLoadedState)
              ? const HavaDurumuGeldi()
              : (_weatherViewModel.state == WeatherState.WeatherLoadingState)
                  ? havaDurumuGetiriliyor()
                  : (_weatherViewModel.state == WeatherState.WeatherErrorState)
                      ? havaDurumuGetirHata()
                      : const Text('Şehir Seçin...'),
        ));
  }

  havaDurumuGetiriliyor() {
    return const CircularProgressIndicator();
  }

  havaDurumuGetirHata() {
    return const Text('Hava Durumu Getirilemedi...');
  }
}

class HavaDurumuGeldi extends StatefulWidget {
  const HavaDurumuGeldi({Key? key}) : super(key: key);

  @override
  State<HavaDurumuGeldi> createState() => _HavaDurumuGeldiState();
}

class _HavaDurumuGeldiState extends State<HavaDurumuGeldi> {
  late WeatherViewModel _weatherViewModel;
  Completer<void> _refreshIndicator = Completer<void>();

  @override
  void initState() {
    super.initState();
    _refreshIndicator = Completer<void>();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var kisaltma = Provider.of<WeatherViewModel>(context, listen: false)
          .havaDurumuKisaltmasi();
      Provider.of<MyThemeViewModel>(context, listen: false)
          .temaDegistir(kisaltma);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build tetiklendi');
    _refreshIndicator.complete();
    _refreshIndicator = Completer();
    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var kullanicininSectigiSehir = _weatherViewModel.getirilenWeather.title!;
    return GecisliRenkContainer(
      renk: Provider.of<MyThemeViewModel>(context).myTheme.renk,
      child: RefreshIndicator(
        onRefresh: () {
          _weatherViewModel.havaDurumunuGuncelle(kullanicininSectigiSehir);
          return _refreshIndicator.future;
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: LocationWidget(
                secilenSehir: kullanicininSectigiSehir,
              )),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Center(child: SonGuncellemeWidget()), //parametresiz kullanım
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: HavaDurumuResimWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  16.0), //getirilen hava durumunu parametre olarak geçtik
              child: Center(
                  child: MaxveMinSicaklikWidget(
                      bugununDegerleri: _weatherViewModel
                          .getirilenWeather.consolidatedWeather![0])),
            ),
          ],
        ),
      ),
    );
  }
}
