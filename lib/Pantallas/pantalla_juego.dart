import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/Pantallas/pantalla_testeo.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);
  @override
  _game createState() => _game();
}

class _game extends State<Game> {
  FirebaseAuth user = FirebaseAuth.instance;
  FirebaseDatabase firebase = FirebaseDatabase.instance;
  final textUsr = TextEditingController();
  final textPasswd = TextEditingController();
  int vidaEnemy = 50;
  int vidaUsr = 100;
  

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
        vidaUsr = vidaUsr - 10;
      });
    });
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'vidaEnemy: $vidaEnemy',
                  style: const TextStyle(fontSize: 50, color: Colors.white),
                ),
                const SizedBox(
                  height: 500,
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
                        setState(() {
                          vidaEnemy = vidaEnemy - 3;
                          if(vidaEnemy <= 0){
                            vidaEnemy = 0;
                          }
                        });
                      },
                      child: const Text('Atacar'),
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
      Stream<DatabaseEvent> stream =
          firebase.ref("users/" + userCredential.user!.uid).onValue;
      stream.listen((DatabaseEvent event) {
        setState(() {
          Map<dynamic, dynamic> value = event.snapshot.value! as Map;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('User'),
                content: Text(userCredential.user!.email! +
                    "\nNivell: " +
                    value["level"].toString()),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => {Navigator.push(context,  MaterialPageRoute(builder: (context) => PantallaTesteo()),)},
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text("Email no trobat"),
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
              content: const Text("Email invàlid"),
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