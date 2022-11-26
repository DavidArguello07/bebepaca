import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({ Key? key }) : super(key: key);

  @override
  FormularioState createState() => FormularioState();

}

class FormularioState extends State<Formulario> {
      TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Center(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Form(
          // key: formKey,
          child: Column(
            children: [
              const Text(
                "Añadir Publicación",
                style: TextStyle(
                  fontSize: 40,
                  letterSpacing: 10,
                  fontFamily: "Teko",
                  color: Colors.blueGrey,
                ),
              ),
              Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Colors.pink[100],
                        size: 170,
                      )),
                  const Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Colors.blueGrey,
                    size: 170,
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    controller: emailCtrl,
                    // decoration: decoration("Artículo", Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    controller: passwordCtrl,
                    // decoration: decoration("Descripción", Icons.lock_outline),
                    obscureText: true,
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                          text: TextSpan(
                              text: "¿Olvidate tú contraseña? ",
                              style: const TextStyle(color: Colors.blueGrey),
                              children: [
                            TextSpan(
                                text: "Recuperarla",
                                style: TextStyle(
                                    color: Colors.pink[100],
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline))
                          ])))),
              SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blueGrey,
                          elevation: 4,
                          backgroundColor: Colors.pink[100],
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                      onPressed: () {},
                      child: const Text("Guardar")))
            ],
          )
          ),
    )
    );
  }
}