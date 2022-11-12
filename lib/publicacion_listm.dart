import 'package:flutter/material.dart';
import 'package:bebepaca/publicacion.dart';

class PublicacionListm extends StatelessWidget {
const PublicacionListm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView //Container
    (
        padding: const EdgeInsets.all(60),
        // scrollDirection: Axis.vertical,
        children: const <Widget>[
          Publicacion(pathimage: "assets/bebe.jpg"),
          Publicacion(pathimage: "assets/bebe2.jpg"),
          Publicacion(pathimage: "assets/bebe5.jpg"),
          Publicacion(pathimage: "assets/bebe7.jpg"),
          Publicacion(pathimage: "assets/bebe9.jpg"),
          Publicacion(pathimage: "assets/bebe10.jpg"),
        ]
    );
  }
}