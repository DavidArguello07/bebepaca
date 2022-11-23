import 'package:flutter/material.dart';

class PublicacionComent extends StatelessWidget {
  const PublicacionComent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      alignment: const Alignment(0.4,0.9),
      margin: const EdgeInsets.only(right: 50),
      height: 80,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 255, 255, 255),
        // gradient: const LinearGradient(
        //     colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
        //     begin: FractionalOffset(0.2, 0.0),
        //     end: FractionalOffset(1.0, 0.6),
        //     stops: [0.0, 0.6],
        //     tileMode: TileMode.clamp)
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const <Widget>[
            Text(
              "Marca",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Lato",
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            Text("159 LPS",
                          style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Lato",
                  color: Color.fromARGB(255, 0, 0, 0)),
            )
          ]
          ),
    )
    );
  }
}
