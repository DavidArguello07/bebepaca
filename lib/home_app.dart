import 'package:bebepaca/gradient_back.dart';
import 'package:bebepaca/publicacion_listm.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});


  @override
  Widget build(BuildContext context){
    return Stack(
      children: const <Widget>[
        PublicacionListm(),
        GradientBack(title: 'Bienvenido a Bebepaca' ,colorr1: 0xFF99bacb, colorr2: 0xFF584CD1),
      ],
    );
}
}

