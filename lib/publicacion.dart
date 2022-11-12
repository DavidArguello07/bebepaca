import 'package:flutter/material.dart';
// import 'package:bebepaca/publicacion_coment.dart';
import 'package:bebepaca/floatingactionbuttonn.dart';

class Publicacion extends StatelessWidget {
  final String pathimage;

  const Publicacion({Key? key, required this.pathimage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pub = Container(
      height: 240,
      width: 280,
      margin: const EdgeInsets.only(top: 250),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathimage)),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black, blurRadius: 15, offset: Offset(0.0, 7.0))
          ]),
    );

    final coment = Container(
      // alignment: const Alignment(0.2, 0.6),
      // margin: const EdgeInsets.only(right: 50),
      height: 80,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 205, 216, 228),
      ),
      child: Row(
        
          //crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Container(
              width: 100,
              child: const Text(
              "Short Usado",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Lato",
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            ),
            const Text(
              "159 LPS",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Lato",
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            FloatingActionButtonGreen()
          ]),
    );
    return Stack(
        alignment: const Alignment(
          0.5, 1.47
          ),  
          children: <Widget>[
            pub, coment
            ]
          );
  }
}
