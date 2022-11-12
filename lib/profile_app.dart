import 'package:bebepaca/exit.dart';
import 'package:bebepaca/gradient_back.dart';
import 'package:bebepaca/perfil_photo.dart';
import 'package:bebepaca/publicacion_listp.dart';
import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {


    return Stack(
      children: <Widget>[
        const PublicacionListp(),
        const GradientBack(title: 'Perfil', colorr1: 0xFF4268D3, colorr2: 0xFF584CD1),
        Container(
                padding: const EdgeInsets.only(top: 100, left: 40),
          child: const PerfilPhoto()
          ),
        const Exit(),
      ],
    );
  }
}
