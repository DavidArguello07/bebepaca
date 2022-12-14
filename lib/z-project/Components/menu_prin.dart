import 'package:bebepaca/z-project/Routes/profile_app.dart';
import 'package:flutter/material.dart';
import 'package:bebepaca/z-project/Routes/home_app.dart';
import 'package:bebepaca/z-project/Routes/fav_app.dart';

class MenuPrin extends StatefulWidget {
  const MenuPrin({Key? key}) : super(key: key);

  @override
  State<MenuPrin> createState() => _MenuPrin();
}

class _MenuPrin extends State<MenuPrin> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    const HomeApp(),
    const FavApp(),
    const ProfileApp()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color.fromARGB(255, 71, 9, 187),
            colorScheme: const ColorScheme.highContrastDark().copyWith(
              primary: Colors.lightBlue,
            ),
          ),
          child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
            ],
          )),
    );
  }
}
