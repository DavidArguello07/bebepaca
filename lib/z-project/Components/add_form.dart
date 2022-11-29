import 'dart:io';
import 'package:bebepaca/z-project/Components/select_photo_options_screen.dart';
import 'package:bebepaca/z-project/models/pub.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => LoginFormState();
  Pub pub = Pub();
}

class LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  //Llamar a firebase
  // final CollectionReference _products =
  //     FirebaseFirestore.instance.collection('products');

  TextEditingController prendaCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();
  TextEditingController precioCtrl = TextEditingController();
  TextEditingController tallaCtrl = TextEditingController();
  TextEditingController generoCtrl = TextEditingController();

  final lista1 = ["XS", "S", "M", "L", "XL"];
  String vista1 = "Talla";

  final lista2 = ["Masculino", "Femenino", "Otro..."];
  String vista2 = "Género";

  File? _image;

  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    // uploadFile();
    setState(() {
      _image = img;
      Navigator.of(context).pop();
    });
  }

  void uploadFile() async {
    storeEntry(
      String imageURL,
      String nombre,
      String descripcion,
      String precio,
      String talla,
      String genero,
    ) {
      FirebaseFirestore.instance.collection('products').add({
        'descripcion': descripcion,
        'genero': genero,
        'image': imageURL,
        'nombre': nombre,
        'precio': precio,
        'talla': talla
      });
    }

    final file = _image!;
    // final metaData = SettableMetadata(contentType: 'image/jpg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef.child('imagenes/');
    final uploadTask = ref.putFile(file);

    uploadTask.snapshotEvents.listen((event) {
      switch (event.state) {
        case TaskState.running:
          break;
        case TaskState.success:
          ref.getDownloadURL().then((value) {
            storeEntry(value, prendaCtrl.text, descripcionCtrl.text,
                precioCtrl.text, tallaCtrl.text, generoCtrl.text);
          });
          break;
        default:
      }
    });
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Text(
                      "Nueva publicación",
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 10,
                        fontFamily: "Teko",
                        color: Colors.blueGrey,
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: Icon(
                              Icons.outbox,
                              color: Colors.cyan[100],
                              size: 100,
                            )),
                        const Icon(
                          Icons.outbox_outlined,
                          color: Colors.blueGrey,
                          size: 100,
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: prendaCtrl,
                          decoration: decoration(
                              "Prenda", Icons.wallet_travel_outlined),
                          keyboardType: TextInputType.text,
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: descripcionCtrl,
                          maxLines: 5,
                          decoration: decoration(
                              "Descripción", Icons.set_meal_outlined),
                          keyboardType: TextInputType.text,
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: precioCtrl,
                          decoration:
                              decoration("Precio", Icons.set_meal_outlined),
                          keyboardType: TextInputType.number,
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  controller: tallaCtrl,
                                  decoration: decoration(
                                      "Talla", Icons.set_meal_outlined),
                                  keyboardType: TextInputType.text,
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  controller: generoCtrl,
                                  decoration: decoration(
                                      "Género", Icons.set_meal_outlined),
                                  keyboardType: TextInputType.text,
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: InkWell(
                                  onTap: () => _showSelectPhotoOptions(context),
                                  child: const Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 35,
                                  )),
                            ),
                            Center(
                              child: Container(
                                  height: 230.0,
                                  width: 300.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Center(
                                      child: _image == null
                                          ? const Text(
                                              'No imagen',
                                              style: TextStyle(fontSize: 15),
                                            )
                                          : Image.file(_image!))),
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  elevation: 4,
                                  backgroundColor: Colors.cyan[100],
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30)))),
                              onPressed: () {
                                uploadFile();
                              },
                              child: const Text("Guardar"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  elevation: 4,
                                  backgroundColor: Colors.cyan[100],
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30)))),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Atras"))),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  decoration(String text, IconData icon) {
    return InputDecoration(
        labelText: text,
        prefixIcon: Icon(
          icon,
          color: Colors.cyan[100],
        ),
        labelStyle: const TextStyle(color: Colors.blueGrey),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.cyan.withOpacity(0.3), width: 1)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.cyan.withOpacity(0.3), width: 1)));
  }
}



                                // DropdownButton(
                                //   items: lista1
                                //       .map((String e) => DropdownMenuItem(
                                //             value: e,
                                //             child: Text(e),
                                //           ))
                                //       .toList(),
                                //   onChanged: (value) {
                                //     setState(() {
                                //       vista1 = value as String;
                                //     });
                                //   },
                                //   hint: Text(vista1),
                                // ),
                                // DropdownButton(
                                //   items: lista2
                                //       .map((String e) => DropdownMenuItem(
                                //             value: e,
                                //             child: Text(e),
                                //           ))
                                //       .toList(),
                                //   onChanged: (value) {
                                //     setState(() {
                                //       vista2 = value as String;
                                //     });
                                //   },
                                //   hint: Text(vista2),
                                // )