import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  final String title;
  final int colorr1;
  final int colorr2;
  const GradientBack(
      {super.key,
      required this.title,
      required this.colorr1,
      required this.colorr2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 250,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(colorr1), //TONO MAS CLARO AL MAS OSCURO
                Color(colorr2)
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
