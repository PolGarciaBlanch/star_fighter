import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/Pantallas/pantalla_carga.dart';
import 'package:star_fighter/Pantallas/pantalla_principal.dart';
import 'package:star_fighter/Pantallas/pantalla_testeo.dart';
import 'package:star_fighter/control/firabase_data.dart';
import 'package:star_fighter/main.dart';
import 'package:star_fighter/obj/obj_user.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _login createState() => _login();
}

class _login extends State<Login> {
  FirebaseAuth log = FirebaseAuth.instance;
  FirebaseDatabase firebase = FirebaseDatabase.instance;
  FirebaseData fireData = FirebaseData();

  final textUsr = TextEditingController();
  final textPasswd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Star Fighter',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: textUsr,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: textPasswd,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        labelText: 'Contrasenya',
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: 'Contrasenya',
                        hintStyle: const TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          textStyle: const TextStyle(fontSize: 25)),
                      onPressed: () async {
                        if (textUsr.text.isNotEmpty &&
                            textPasswd.text.isNotEmpty) {
                          _log(textUsr.text, textPasswd.text);
                          //carga_test

                        }
                      },
                      child: const Text('Accedir'),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          textStyle: const TextStyle(fontSize: 25)),
                      onPressed: () {
                        Navigator.pushNamed(context, 'pantalla_crea_usr');
                      },
                      child: const Text('Crear Usuari'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _log(String email, String pwd) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pwd);
      loggedUser.clear();
      loggedUser.add(await fireData.GetObj(
          User_.fromDatabaseJson, fireData.user, userCredential.user!.uid));
      Navigator.pushReplacementNamed(context, 'pantalla_carga');
      /*
      User_ user = User_.genUser();
      user.id = userCredential.user!.uid;
      fireData.NewObjWithKey(user.toDatabaseJson(), fireData.user,userCredential.user!.uid);

      */
      /*Stream<DatabaseEvent> stream =
          firebase.ref("users/" + userCredential.user!.uid).onValue;
      stream.listen((DatabaseEvent event) {
        setState(() {
          Map<dynamic, dynamic> value = event.snapshot.value! as Map;
          Navigator.pushReplacementNamed(context, 'pantalla_carga');
        });
      });*/
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text("Email no encontrado"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text("Contrasenya incorrecta"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text("Email inválido"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
