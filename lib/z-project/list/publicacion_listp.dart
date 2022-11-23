import 'package:flutter/material.dart';
import 'package:bebepaca/z-project/Components/publicacion.dart';

class PublicacionListp extends StatelessWidget {
const PublicacionListp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView //Container
    (
        // padding: const EdgeInsets.all(50),
        // scrollDirection: Axis.vertical,
        children: const <Widget>[
          Publicacion(pathimage: "assets/bebe4.jpg", name: "Camisa",price: "35 LPS"),
          Publicacion(pathimage: "assets/bebe3.jpg", name: "Camisa",price: "35 LPS"),
          Publicacion(pathimage: "assets/bebe7.jpg", name: "Camisa",price: "35 LPS"),
          Publicacion(pathimage: "assets/bebe9.jpg", name: "Camisa",price: "35 LPS"),
          Publicacion(pathimage: "assets/bebe5.jpg", name: "Camisa",price: "35 LPS"),
          Publicacion(pathimage: "assets/bebe8.jpg", name: "Camisa",price: "35 LPS"),
        ]
    );
  }
}