import 'package:flutter/material.dart';
import 'package:bebepaca/z-project/Components/publicacion.dart';

class PublicacionListm extends StatelessWidget {
const PublicacionListm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView //Container
    (
        padding: const EdgeInsets.all(60),
        // scrollDirection: Axis.vertical,
        children: const <Widget>[
          Publicacion(pathimage: "assets/bebe.jpg", name: "Camisa",price: "35 LPS"),
          Publicacion(pathimage: "assets/bebe2.jpg", name: "Camisa",price: "35 LPS"),
          Publicacion(pathimage: "assets/bebe5.jpg", name: "Camisa",price: "35 LPS"),
          Publicacion(pathimage: "assets/bebe7.jpg", name: "Camisa",price: "35 LPS"),
          Publicacion(pathimage: "assets/bebe9.jpg", name: "Camisa",price: "35 LPS"),
          Publicacion(pathimage: "assets/bebe10.jpg", name: "Camisa",price: "35 LPS"),
        ]
    );
  }
}