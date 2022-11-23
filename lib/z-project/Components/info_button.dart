import 'package:bebepaca/z-project/Components/info_page.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  InfoState createState() => InfoState();
}

class InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 173, 29, 29),
        mini: true,
        tooltip: "Fav",
        onPressed: () => {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => const InfoPage())),
        },
        child: const Icon(Icons.library_books)
        );
  }
}
