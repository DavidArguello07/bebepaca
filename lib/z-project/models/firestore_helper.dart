// import 'package:bebepaca/singleton/getnfo.dart';
import 'package:bebepaca/z-project/models/pub.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  //crear
  static Future createpub(Pub pub, String userId) async {
    final userCollection = FirebaseFirestore.instance.collection('post');
    // InfoUser infoUser = InfoUser();

    //Agrega nuevo documento
    final pid = userCollection.doc().id;

    final docRef = userCollection.doc(pid);
    //acceso a un doc en especifico

    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    final newpub = Pub(
            uid: userId,
            id: pid,
            nombre: pub.nombre,
            descripcion: pub.descripcion,
            talla: pub.talla,
            genero: pub.genero,
            precio: pub.precio,
            image: pub.image,
            like: false)
        .toJson();

    try {
      await docRef.set(newpub);
    } catch (e) {
      print("EL ERROR ES $e");
    }
  }

  // leer
  static Stream<List<Pub>> readpub() {
    final userCollection = FirebaseFirestore.instance.collection('post');
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => Pub.fromSnapshot(e)).toList());
  }

  //modificar
  static Future updatepub(Pub pub) async {
    final userCollection = FirebaseFirestore.instance.collection('post');
    final docRef = userCollection.doc(pub.id);
    final newpub = Pub(
            id: pub.id,
            uid: pub.uid,
            nombre: pub.nombre,
            descripcion: pub.descripcion,
            talla: pub.talla,
            genero: pub.genero,
            precio: pub.precio,
            image: pub.image,
            like: pub.like)
        .toJson();

    try {
      await docRef.update(newpub);
    } catch (e) {
      // print(e);
    }
  }

  //Borrar
  static Future delete(Pub pub) async {
    final userCollection = FirebaseFirestore.instance.collection('post');

    final docRef = userCollection.doc(pub.id).delete();
  }

  //Like
  static Future fav(Pub pub) async {
    final userCollection = FirebaseFirestore.instance.collection('post');
    final docRef = userCollection.doc(pub.id);
    final newpub = Pub(
            id: pub.id,
            uid: pub.uid,
            nombre: pub.nombre,
            descripcion: pub.descripcion,
            talla: pub.talla,
            genero: pub.genero,
            precio: pub.precio,
            image: pub.image,
            like: pub.like)
        .toJson();

    try {
      await docRef.update(newpub);
    } catch (e) {
      // print(e);
    }
  }
}


  // QuerySnapshot snap = await FirebaseFirestore.instance
  //   .collection('users')
  //   .doc(FirebaseAuth.instance.currentUser!.uid)
  //   .get();

  // final userCollection2 = FirebaseFirestore.instance.collection('post').where(field);