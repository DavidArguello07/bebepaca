import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      const Text("SIUUUUUUUUUUUUUU"),
      ElevatedButton(
          onPressed: () => {Navigator.pop(context)}, child: const Text("Salir"))
    ]));
  }
}
