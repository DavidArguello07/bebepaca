import 'package:bebepaca/z-project/models/pub.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  //crear
  static Future createpub(Pub pub) async {
    final userCollection = FirebaseFirestore.instance.collection('post');

    //Agrega nuevo documento
    final uid = userCollection.doc().id;

    final docRef = userCollection.doc(uid);
    //acceso a un doc en especifico

    final newpub = Pub(
            id: uid,
            nombre: pub.nombre,
            descripcion: pub.descripcion,
            talla: pub.talla,
            genero: pub.genero,
            precio: pub.precio,
            image: pub.image)
        .toJson();

    try {
      await docRef.set(newpub);
    } catch (e) {
      print("EL ERROR ES $e");
    }
  }

  // leer
  static Stream<List<Pub>> readpub() {
    final userCollection = FirebaseFirestore.instance.collection('produc');
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => Pub.fromSnapshot(e)).toList());
  }

  //modificar
  static Future updatepub(Pub pub) async {
    final userCollection = FirebaseFirestore.instance.collection('produ');

    //Agrega nuevo documento

    final docRef = userCollection.doc(pub.id);

    final newpub = Pub(
            id: pub.id,
            nombre: pub.nombre,
            descripcion: pub.descripcion,
            talla: pub.talla,
            genero: pub.genero,
            precio: pub.precio,
            image: pub.image)
        .toJson();

    try {
      await docRef.update(newpub);
    } catch (e) {
      print(e);
    }
  }
}
