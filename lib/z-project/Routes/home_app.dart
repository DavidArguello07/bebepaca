import 'package:bebepaca/z-project/Components/gradient_back.dart';
import 'package:bebepaca/z-project/list/publicacion_listm.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: const <Widget>[
        PublicacionListm(),
        GradientBack(
            title: 'Bienvenido a Bebepaca',
            colorr1: 0xFF99bacb,
            colorr2: 0xFF584CD1),
      ],
    ));
  }
}
