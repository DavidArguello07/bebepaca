import 'package:bebepaca/z-project/Components/gradient_back.dart';
import 'package:bebepaca/z-project/models/edit.dart';
import 'package:bebepaca/z-project/models/firestore_helper.dart';
import 'package:bebepaca/z-project/models/pub.dart';
import 'package:flutter/material.dart';

class FavApp extends StatelessWidget {
  const FavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: <Widget>[
        StreamBuilder<List<Pub>>(
          stream: FirestoreHelper.readpub(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Ocurrio un error"),
              );
            }
            if (snapshot.hasData) {
              final userData = snapshot.data;
              return ListView.builder(
                  itemCount: userData!.length,
                  itemBuilder: (context, index) {
                    final singleUser = userData[index];
                    return Column(
                      children: [
                        Text("${singleUser.nombre}"),
                        Text("${singleUser.descripcion}"),
                        Text("${singleUser.genero}"),
                        Text("${singleUser.precio}"),
                        Text("${singleUser.talla}"),
                        Text("${singleUser.image}"),
                        Text("${singleUser.id}"),
                        InkWell(onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Edit(
                                        pub: Pub(
                                            nombre: singleUser.nombre,
                                            descripcion: singleUser.descripcion,
                                            genero: singleUser.genero,
                                            precio: singleUser.precio,
                                            talla: singleUser.talla,
                                            image: singleUser.image),
                                      )));
                        })
                      ],
                    );
                  });
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        const GradientBack(
            title: 'Favoritos', colorr1: 0xFF99bacb, colorr2: 0xFF584CD1),
      ],
    ));
  }
}
