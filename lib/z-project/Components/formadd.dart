import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Form(
          key: formKey,
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
                    decoration: decoration("Artículo", Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    controller: passwordCtrl,
                    decoration: decoration("Descripción", Icons.lock_outline),
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

  decoration(String text, IconData icon) {
    return InputDecoration(
        labelText: text,
        prefixIcon: Icon(
          icon,
          color: Colors.pink[100],
        ),
        labelStyle: const TextStyle(color: Colors.blueGrey),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.pink.withOpacity(0.3), width: 1)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.pink.withOpacity(0.3), width: 1)));
  }

  save() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.reset();
    }
  }
}
