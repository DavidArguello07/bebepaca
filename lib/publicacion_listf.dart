import 'package:flutter/material.dart';
import 'package:bebepaca/publicacion.dart';

class PublicacionListf extends StatelessWidget {
const PublicacionListf({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView //Container
    (
        padding: const EdgeInsets.all(60),
        // scrollDirection: Axis.vertical,
        children: const <Widget>[
          Publicacion(pathimage: "assets/bebe10.jpg"),
          Publicacion(pathimage: "assets/bebe2.jpg"),
          Publicacion(pathimage: "assets/bebe7.jpg"),
          Publicacion(pathimage: "assets/bebe4.jpg"),
          Publicacion(pathimage: "assets/bebe5.jpg"),
          Publicacion(pathimage: "assets/bebe6.jpg"),
        ]
    );
  }
}