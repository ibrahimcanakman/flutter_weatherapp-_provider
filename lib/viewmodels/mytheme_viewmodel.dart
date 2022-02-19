import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/models/my_theme.dart';

class MyThemeViewModel with ChangeNotifier {
  late MyTheme _myTheme;

  MyThemeViewModel() {
    _myTheme = MyTheme(Colors.blue, ThemeData.light());
  }
  MyTheme get myTheme => _myTheme;

  set myTheme(MyTheme value) {
    _myTheme = value;
    notifyListeners();
  }

  void temaDegistir(String havaDurumuKisaltmasi) {
    MyTheme? _geciciTema;
    switch (havaDurumuKisaltmasi) {
      case 'sn':
      case 'sl':
      case 'h':
      case 't':
      case 'hc':
        _geciciTema =
            MyTheme(Colors.grey, ThemeData(primaryColor: Colors.blueGrey));

        break;
      case 'hr':
      case 'lr':
      case 's':
        _geciciTema = MyTheme(
            Colors.indigo, ThemeData(primaryColor: Colors.indigoAccent));

        break;
      case 'lc':
      case 'c':
        _geciciTema = MyTheme(
            Colors.yellow, ThemeData(primaryColor: Colors.yellowAccent));

        break;
      default:
    }

    myTheme = _geciciTema!;
  }
}
