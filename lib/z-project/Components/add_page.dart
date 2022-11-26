import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  var formulario = Container(
    color: Colors.black,
    child: AlertDialog(
      content: SingleChildScrollView(
          child: Container(
        width: 320.0,
        height: 240.0,
        color: Colors.orange, // grey box
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 253, 253),
                ),
                // padding: const EdgeInsets.all(9.0),
                width: 240.0, // red box
                child: const Text(
                  "Lorem ipsum",
                ), //max-width is 240.0
              ),
            ]),
      )),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          formulario,
          ElevatedButton(
              onPressed: () => {Navigator.pop(context)},
              child: const Text("Salir"))
        ],
      ),
    );
  }
}
