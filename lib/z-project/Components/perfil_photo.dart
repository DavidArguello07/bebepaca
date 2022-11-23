import 'package:flutter/material.dart';

class PerfilPhoto extends StatelessWidget {
const PerfilPhoto({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      // margin: const EdgeInsets.only(top: 20.0, left: 20.0),
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("assets/man.jpg")
              )
              ),
    );
  }
}