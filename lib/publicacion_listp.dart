import 'package:flutter/material.dart';
import 'package:bebepaca/publicacion.dart';

class PublicacionListp extends StatelessWidget {
const PublicacionListp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView //Container
    (
        padding: const EdgeInsets.all(50),
        // scrollDirection: Axis.vertical,
        children: const <Widget>[
          Publicacion(pathimage: "assets/bebe4.jpg"),
          Publicacion(pathimage: "assets/bebe3.jpg"),
          Publicacion(pathimage: "assets/bebe7.jpg"),
          Publicacion(pathimage: "assets/bebe9.jpg"),
          Publicacion(pathimage: "assets/bebe5.jpg"),
          Publicacion(pathimage: "assets/bebe8.jpg"),
        ]
    );
  }
}