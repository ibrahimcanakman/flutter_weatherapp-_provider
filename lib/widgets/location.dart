import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String secilenSehir;
  const LocationWidget({Key? key, required this.secilenSehir})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      secilenSehir,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
