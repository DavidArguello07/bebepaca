import 'package:bebepaca/z-project/Components/gradient_back.dart';
import 'package:bebepaca/z-project/list/publicacion_listf.dart';
import 'package:flutter/material.dart';

class FavApp extends StatelessWidget {
  const FavApp({super.key});


  @override
  Widget build(BuildContext context){

    return Stack(
      children: const <Widget>[
        PublicacionListf(),
        GradientBack(title: 'Favoritos' ,colorr1: 0xFF4268D3, colorr2: 0xFF584CD1
),
      ],
    );
  }
}