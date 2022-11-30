import 'package:bebepaca/z-project/models/edit.dart';
import 'package:bebepaca/z-project/models/pub.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  HomeAppState createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('post');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Bienvendio")),
      body: StreamBuilder(
        stream: products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];

                  return Column(
                    children: [
                      Container(
                        height: 300,
                        margin: const EdgeInsets.only(
                            top: 275, left: 40, right: 40),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(documentSnapshot['image'])),
                            color: const Color.fromARGB(71, 74, 204, 243),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            shape: BoxShape.rectangle,
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 18,
                                  offset: Offset(0.0, 7.0))
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 70, 167, 212),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    documentSnapshot['nombre'],
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    documentSnapshot['talla'],
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    documentSnapshot['genero'],
                                    style: const TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      documentSnapshot['descripcion'],
                                      style: const TextStyle(fontSize: 4),
                                    ),
                                    Text(
                                      documentSnapshot['precio'],
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
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
    ));
  }
}
