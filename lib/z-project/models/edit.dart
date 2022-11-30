import 'dart:io';
import 'package:bebepaca/z-project/Components/select_photo_options_screen.dart';
import 'package:bebepaca/z-project/models/firestore_helper.dart';
import 'package:bebepaca/z-project/models/pub.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatefulWidget {
  final Pub pub;
  const Edit({Key? key, required this.pub}) : super(key: key);

  @override
  EditState createState() => EditState();
}

class EditState extends State<Edit> {
  TextEditingController? prendaCtrl;
  TextEditingController? descripcionCtrl;
  TextEditingController? precioCtrl;
  TextEditingController? tallaCtrl;
  TextEditingController? generoCtrl;

  @override
  void initState() {
    prendaCtrl = TextEditingController(text: widget.pub.nombre);
    descripcionCtrl = TextEditingController(text: widget.pub.descripcion);
    precioCtrl = TextEditingController(text: widget.pub.precio);
    tallaCtrl = TextEditingController(text: widget.pub.talla);
    generoCtrl = TextEditingController(text: widget.pub.genero);
    super.initState();
  }

  @override
  void dispose() {
    prendaCtrl!.dispose();
    descripcionCtrl!.dispose();
    precioCtrl!.dispose();
    tallaCtrl!.dispose();
    generoCtrl!.dispose();
    super.dispose();
  }

  File? _image;

  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    setState(() {
      _image = img;
      Navigator.of(context).pop();
    });
  }

  void uploadFile() async {
    final file = _image!;
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef.child('imagenes/');
    final uploadTask = ref.putFile(file);

    uploadTask.snapshotEvents.listen((event) {
      switch (event.state) {
        case TaskState.running:
          break;
        case TaskState.success:
          ref.getDownloadURL().then((value) {
            FirestoreHelper.createpub(Pub(
              // nombre: prendaCtrl.text,
              // descripcion: descripcionCtrl.text,
              // precio: precioCtrl.text,
              // talla: tallaCtrl.text,
              // genero: generoCtrl.text,
              image: value,
            ));
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
      child: Scaffold(
        appBar: AppBar(title: const Text('edit')),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: prendaCtrl,
                    decoration:
                        decoration("Prenda", Icons.wallet_travel_outlined),
                    keyboardType: TextInputType.text,
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: descripcionCtrl,
                    maxLines: 5,
                    decoration:
                        decoration("Descripción", Icons.set_meal_outlined),
                    keyboardType: TextInputType.text,
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: precioCtrl,
                    decoration: decoration("Precio", Icons.set_meal_outlined),
                    keyboardType: TextInputType.number,
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: tallaCtrl,
                            decoration:
                                decoration("Talla", Icons.set_meal_outlined),
                            keyboardType: TextInputType.text,
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: generoCtrl,
                            decoration:
                                decoration("Género", Icons.set_meal_outlined),
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
                  ))
            ],
          ),
        ),
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
