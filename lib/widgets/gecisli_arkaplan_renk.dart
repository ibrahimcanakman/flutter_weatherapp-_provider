import 'package:flutter/material.dart';

class GecisliRenkContainer extends StatelessWidget {
  final Widget child;
  final MaterialColor renk;

  const GecisliRenkContainer(
      {Key? key, required this.child, required this.renk})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [renk, renk.shade500, renk.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.4, 1])),
    );
  }
}
