import 'package:bebepaca/z-project/Components/add_page.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  AddState createState() => AddState();
}

class AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ElevatedButton(
            onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  const AddPage())),
                },
            child: const Icon(Icons.add_a_photo)));
  }
}
