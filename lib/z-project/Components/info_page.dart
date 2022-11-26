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
    String descripcion = "Camisa deportiva de la selección de Honduras";
    String precio = "169 LPS";
    String talla = "S";
    String genero = "Masculino";
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(color: Colors.red),

      width: MediaQuery.of(context).size.width,
      height: 500,
      // alignment: const Alignment(-0,0.6),
      // color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text("Articulo: ",
                    textAlign: TextAlign.center,
                    softWrap: false,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
                Text(nombre,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.none)),
              ],
            ),
            Row(
              children: [
                const Text("Descripción: ",
                    textAlign: TextAlign.center,
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
                Text(descripcion,
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.none)),
              ],
            ),
            Row(
              children: [
                const Text("Precio: ",
                    textAlign: TextAlign.center,
                    softWrap: false,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
                Text(precio,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.none)),
              ],
            ),
            Row(
              children: [
                const Text("Talla: ",
                    textAlign: TextAlign.center,
                    softWrap: false,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
                Text(talla,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.none)),
              ],
            ),
            Row(
              children: [
                const Text("Género: ",
                    textAlign: TextAlign.center,
                    softWrap: false,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
                Text(genero,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.none)),
              ],
            ),
            ElevatedButton(
                onPressed: () => {Navigator.pop(context)},
                child: const Text("Salir"))
          ]),
    ));
  }
}
      // crossAxisAlignment: CrossAxisAlignment.start,



//       Text(
// "Hola mundo", style: TextStyle(
// color:Colors.white, 
// fontSize:30, 
// fontWeight: FontWeight.400, 
// letterSpacing: 5, 
// wordSpacin: 20,
// backgroundColor: Colors.black,
// fontFamily: "Montserrat",
// decoration: TextDecoration.underline
//  ), // TextStyle
// textAlign: TextAlign.Center,
// softWrap: false,
// maxLines: 2, //numero de lineas
// overflow: TextOverflow.ellipsis, //agregar los ... para que el usuario sepa que hay más texto
// )
