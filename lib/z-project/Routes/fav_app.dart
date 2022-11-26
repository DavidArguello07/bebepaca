import 'package:bebepaca/z-project/Components/gradient_back.dart';
import 'package:flutter/material.dart';

class FavApp extends StatelessWidget {
  const FavApp({super.key});


  @override
  Widget build(BuildContext context){
    
    return SafeArea(
        child: Stack(
      children: const <Widget>[

        GradientBack(
            title: 'Favoritos',
            colorr1: 0xFF99bacb,
            colorr2: 0xFF584CD1),
      ],
    ));
  
  }
}