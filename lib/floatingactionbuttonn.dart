import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  const FloatingActionButtonGreen({super.key});

  @override
  State<FloatingActionButtonGreen> createState() =>
      _FloatingActionButtonGreen();
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool _pressed = true;
  // IconData IconFav = Icons.favorite_border;
  // Color ColorBack = Color(0xFF11DA53);
  // Color ColorIcon = Colors.white;

  void onPressedFav() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _pressed
            ? const Text("Lo quitaste de tus favoritos")
            : const Text("Lo agregaste a tus favoritos"),
        duration: const Duration(milliseconds: 400),
      ),
    );
    setState(() {
      if (_pressed) {
        _pressed = false;
      } else {
        _pressed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color(0xFF11DA53),
        mini: true,
        tooltip: "Fav",
        onPressed: onPressedFav,
        child: Icon(_pressed ? Icons.favorite : Icons.favorite_border));
  }
}
