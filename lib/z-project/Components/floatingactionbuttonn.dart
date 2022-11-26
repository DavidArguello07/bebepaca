import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
   const FloatingActionButtonGreen({super.key});

  @override
  State<FloatingActionButtonGreen> createState() =>FloatingActionButtonGreenState();
}

class FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  bool _pressed = false;
  // IconData IconFav = Icons.favorite_border;
  // Color ColorBack = Color(0xFF11DA53);
  // Color ColorIcon = Colors.white;



  @override
  Widget build(BuildContext context) {
  void onPressedFav() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _pressed
            ? const Text("Lo quitaste de tus favoritos")
            : const Text("Lo agregaste a tus favoritos"),
        duration:  const Duration(milliseconds: 400),
      ),
    );
    
    setState(() {
      if (_pressed) {
        _pressed = false;
      } else {
        _pressed = true;
      }
      }
    );
  }

    return FloatingActionButton(
        backgroundColor: const Color(0xFF11DA53),
        mini: true,
        tooltip: "Fav",
        heroTag: "btn1",
        onPressed: onPressedFav,
        child: Icon(_pressed ? Icons.favorite : Icons.favorite_border)
    );
  }
}
