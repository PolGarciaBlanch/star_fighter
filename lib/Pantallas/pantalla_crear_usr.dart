import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);
  @override
  _create createState() => _create();
}

class _create extends State<Create> {
  FirebaseAuth log = FirebaseAuth.instance;
  FirebaseDatabase firebase = FirebaseDatabase.instance;
  final textUsr = TextEditingController();
  final textPasswd = TextEditingController();
  final textUsrname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: textUsrname,
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
                      labelText: 'Username',
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: 'Username',
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
                  width: 175,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        textStyle: const TextStyle(fontSize: 25)),
                    onPressed: () async {
                      if (textUsr.text.isNotEmpty &&
                          textPasswd.text.isNotEmpty &&
                          textUsrname.text.isNotEmpty) {
                        register(
                            textUsr.text, textPasswd.text, textUsrname.text);
                      }
                    },
                    child: const Text('Crear usuari'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register(String email, String pwd, String usrname) async {
    try {

      UserCredential usercredentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pwd);
      firebase.ref("users/" + usercredentials.user!.uid).set({"user_name": usrname, "level": 0});
      Navigator.pushReplacementNamed(context, 'carga_test');

    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(e.code),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            );
          });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(e.toString()),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            );
          });
    }
  }
}
