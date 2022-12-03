import 'package:bebepaca/auth/bloc/auth_bloc.dart';
import 'package:bebepaca/auth/models/admin_user_model.dart';
import 'package:bebepaca/singleton/getnfo.dart';
import 'package:bebepaca/z-project/Components/add_button.dart';
import 'package:bebepaca/z-project/Components/exit.dart';
import 'package:bebepaca/z-project/Components/gradient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileApp extends StatefulWidget {
  const ProfileApp({Key? key}) : super(key: key);

  @override
  ProfileAppState createState() => ProfileAppState();
}

class ProfileAppState extends State<ProfileApp> {
  late AdminUserModel admin;
  InfoUser infoUser = InfoUser();
  String? useruidd;
  String username = '';
  String userid = '';
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    super.initState();
  }

  final CollectionReference products =
      FirebaseFirestore.instance.collection('post');

  late Query test2 = products.where('uid', isEqualTo: authBloc.getUser!.uid);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xffD6EAF8),
          body: StreamBuilder(
            stream: test2.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];

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
                                      image: NetworkImage(
                                          documentSnapshot['image']),
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
                                        documentSnapshot['nombre'],
                                        style: const TextStyle(fontSize: 15.5),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: "Talla: ",
                                            style: const TextStyle(
                                                fontSize: 15.5,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                decoration:
                                                    TextDecoration.none),
                                            children: [
                                              TextSpan(
                                                text: documentSnapshot['talla'],
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    decoration:
                                                        TextDecoration.none),
                                              )
                                            ]),
                                      ),
                                      Text(
                                        documentSnapshot['genero'],
                                        style: const TextStyle(fontSize: 15.5),
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
                                            documentSnapshot['descripcion'],
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
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    decoration:
                                                        TextDecoration.none),
                                                children: [
                                                  TextSpan(
                                                    text: documentSnapshot[
                                                        'precio'],
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
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
        GradientBack(
            title: authBloc.getUser!.displayName ?? "",
            colorr1: 0xFF4268D3,
            colorr2: 0xFF584CD1),
        const Exit(),
        const Add(),
      ],
    ));
  }
}
