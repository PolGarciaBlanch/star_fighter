import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _login createState() => _login();
}

class _login extends State<Login> {
  FirebaseAuth log = FirebaseAuth.instance;
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
                      labelText: 'Usuari',
                    ),
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
                    ),
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
                      onPressed: () {},
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Usuari invalid');
      }
    }
  }
}
