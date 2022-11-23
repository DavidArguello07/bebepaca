import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () => {Navigator.pop(context)},
              child: const Text("Salir"))
        ],
      ),
    );
  }
}
