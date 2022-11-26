import 'package:bebepaca/z-project/Components/info_button.dart';
import 'package:flutter/material.dart';
// import 'package:bebepaca/publicacion_coment.dart';
import 'package:bebepaca/z-project/Components/floatingactionbuttonn.dart';

class Publicacion extends StatelessWidget {
  final String pathimage;
  final String name;
  final String price;

  const Publicacion(
      {Key? key,
      required this.pathimage,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {



    final pub = Container(
      height: 240,
      width: 250,
     margin: const EdgeInsets.only(top: 250),
      decoration: BoxDecoration(
          image:DecorationImage(fit: BoxFit.cover, image: AssetImage(pathimage)),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black, blurRadius: 15, offset: Offset(0.0, 7.0))
          ]),
    );

    final coment = Container(
      // alignment: const Alignment(0.2, 0.6),
      // margin: const EdgeInsets.only(bottom: 20),
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
            SizedBox(
              width: 100,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: "Lato",
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            Text(
              price,
              style:  const TextStyle(
                  fontSize: 15,
                  fontFamily: "Lato",
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const FloatingActionButtonGreen(),
            const Info(),
          ]
      ),
    );

    return SafeArea(
      child: Column(
        // alignment: const Alignment(0.5, 1.47), 
        children: <Widget>[
          pub, 
          coment,
        ]
    )); 
  }
}
