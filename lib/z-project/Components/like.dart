import 'package:bebepaca/z-project/models/firestore_helper.dart';
import 'package:bebepaca/z-project/models/pub.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final Pub pub;

  const FloatingActionButtonGreen({super.key, required this.pub});

  @override
  State<FloatingActionButtonGreen> createState() =>
      FloatingActionButtonGreenState();
}

class FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  bool pressed = false;
  // IconData IconFav = Icons.favorite_border;
  // Color ColorBack = Color(0xFF11DA53);
  // Color ColorIcon = Colors.white;

  @override
  Widget build(BuildContext context) {
    @override
    void onPressedFav() async {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: pressed
              ? const Text("Lo quitaste de tus favoritos")
              : const Text("Lo agregaste a tus favoritos"),
          duration: const Duration(milliseconds: 400),
        ),
      );

      setState(() {
        if (pressed) {
          pressed = false;
        } else {
          pressed = true;
        }
      });

      FirestoreHelper.fav(Pub(
        id: widget.pub.id,
        uid: widget.pub.uid,
        nombre: widget.pub.nombre,
        descripcion: widget.pub.descripcion,
        precio: widget.pub.precio,
        talla: widget.pub.talla,
        genero: widget.pub.genero,
        image: widget.pub.image,
        // like: pressed ? true : false,
        like: widget.pub.like ? false : true,
      ));
    }

    return FloatingActionButton(
        backgroundColor: const Color(0xFF11DA53),
        mini: true,
        tooltip: "Fav",
        heroTag: "btn1",
        onPressed: onPressedFav,
        child: Icon(pressed ? Icons.favorite : Icons.favorite_border));
  }
}
// pressed ? Icons.favorite : Icons.favorite_border