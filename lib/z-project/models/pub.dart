import 'package:cloud_firestore/cloud_firestore.dart';

class Pub {
  final String? uid;
  final String? id;
  final String? nombre;
  final String? descripcion;
  final String? precio;
  final String? talla;
  final String? genero;
  final String? image;
  bool like;

  Pub(
      {this.uid,
      this.id,
      this.nombre,
      this.descripcion,
      this.precio,
      this.talla,
      this.genero,
      this.image,
      this.like = false});

  //metodos de conversion

  factory Pub.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Pub(
        uid: snapshot['uid'],
        id: snapshot['id'],
        nombre: snapshot['nombre'],
        descripcion: snapshot['descripcion'],
        precio: snapshot['precio'],
        talla: snapshot['talla'],
        genero: snapshot['genero'],
        image: snapshot['image'],
        like: snapshot['like']);
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'id': id,
        'nombre': nombre,
        'descripcion': descripcion,
        'precio': precio,
        'talla': talla,
        'genero': genero,
        'image': image,
        'like': like
      };
}
