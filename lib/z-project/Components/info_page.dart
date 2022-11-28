import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  // late String nombre;
  // late String descripcion;
  // late String precio;
  // late String talla;
  // late String genero;

  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    String nombre = "Camisa deportiva";
    String descripcion = "Camisa deportivselección de Honduras";
    String precio = "169 LPS";
    String talla = "S";
    String genero = "Masculino";
    return SafeArea(
        child: Material(
      child: Center(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: TextSpan(
                          text: "Artículo: ",
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none),
                          children: [
                            TextSpan(
                              text: nombre,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: TextSpan(
                          text: "Descripción: ",
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none),
                          children: [
                            TextSpan(
                              text: descripcion,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: TextSpan(
                          text: "Precio: ",
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none),
                          children: [
                            TextSpan(
                              text: precio,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: TextSpan(
                          text: "Talla: ",
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none),
                          children: [
                            TextSpan(
                              text: talla,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: TextSpan(
                          text: "Género: ",
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none),
                          children: [
                            TextSpan(
                              text: genero,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: const Alignment(0.0, 0.0),
                child: ElevatedButton.icon(
                  onPressed: () => {Navigator.pop(context)},
                  icon: const Icon(Icons.logout_outlined),
                  label: const Text(
                    "Atras",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              )
            ])),
      ),
    ));
  }
}
