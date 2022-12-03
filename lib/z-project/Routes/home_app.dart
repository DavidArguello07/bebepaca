import 'package:bebepaca/z-project/Components/like.dart';
import 'package:bebepaca/z-project/Components/gradient.dart';
import 'package:bebepaca/z-project/models/edit.dart';
import 'package:bebepaca/z-project/models/firestore_helper.dart';
import 'package:bebepaca/z-project/models/pub.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  HomeAppState createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xffD6EAF8),
          body: StreamBuilder(
            stream: FirestoreHelper.readpub(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text("Cargando..."),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Text("Hay un error"),
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
                          Stack(
                            children: [
                              Container(
                                height: 300,
                                margin: const EdgeInsets.only(
                                    top: 215, left: 40, right: 40),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(singleUser.image!),
                                    ),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    shape: BoxShape.rectangle,
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 20,
                                          offset: Offset(0.0, 7.0))
                                    ]),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 15, right: 15, bottom: 15),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(99, 70, 73, 173),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        singleUser.nombre!,
                                        style: const TextStyle(
                                            fontSize: 15.5,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: "Talla: ",
                                            style: const TextStyle(
                                                fontSize: 15.5,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.w700,
                                                decoration:
                                                    TextDecoration.none),
                                            children: [
                                              TextSpan(
                                                text: ("${singleUser.talla}"),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontWeight: FontWeight.w400,
                                                    decoration:
                                                        TextDecoration.none),
                                              )
                                            ]),
                                      ),
                                      Text(
                                        "${singleUser.genero}",
                                        style: const TextStyle(
                                            fontSize: 15.5,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                      FloatingActionButtonGreen(
                                        pub: Pub(
                                            nombre: singleUser.nombre,
                                            descripcion: singleUser.descripcion,
                                            id: singleUser.id,
                                            uid: singleUser.uid,
                                            talla: singleUser.talla,
                                            precio: singleUser.precio,
                                            genero: singleUser.genero,
                                            image: singleUser.image,
                                            like: singleUser.like),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          // flex: 2,
                                          child: Text(
                                            "${singleUser.descripcion}",
                                            style:
                                                const TextStyle(fontSize: 15.5),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: RichText(
                                            text: TextSpan(
                                                text: "LPS. ",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 2, 2, 2),
                                                    fontWeight: FontWeight.w400,
                                                    decoration:
                                                        TextDecoration.none),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "${singleUser.precio}",
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  )
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        child: const Icon(Icons.edit),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Edit(
                                                      pub: Pub(
                                                          nombre:
                                                              singleUser.nombre,
                                                          descripcion:
                                                              singleUser
                                                                  .descripcion,
                                                          id: singleUser.id,
                                                          uid: singleUser.uid,
                                                          talla:
                                                              singleUser.talla,
                                                          precio:
                                                              singleUser.precio,
                                                          genero:
                                                              singleUser.genero,
                                                          image: singleUser
                                                              .image))));
                                        },
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                        onPressed: () {},
                                        onLongPress: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      "Eliminar Publicación"),
                                                  content: const Text(
                                                      "¿Seguro que quieres eliminar la publicación?"),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: (() {
                                                          FirestoreHelper.delete(
                                                                  singleUser)
                                                              .then((value) => {
                                                                    Navigator.pop(
                                                                        context)
                                                                  });
                                                        }),
                                                        child: const Text(
                                                            "Eliminar"))
                                                  ],
                                                );
                                              });
                                        },
                                        child: const Icon(Icons.delete),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    });
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        const GradientBack(
            title: 'Bienvenido a Bebepaca',
            colorr1: 0xFF4268D3,
            colorr2: 0xFF584CD1),
      ],
    ));
  }
}
