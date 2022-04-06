import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/Pantallas/pantalla_testeo.dart';
import 'package:star_fighter/control/dbData.dart';

class Game extends StatefulWidget  {
  const Game({Key? key}) : super(key: key);
  @override
  _game createState() => _game();
}

class _game extends State<Game> {
  FirebaseAuth user = FirebaseAuth.instance;
  FirebaseDatabase firebase = FirebaseDatabase.instance;
  final textUsr = TextEditingController();
  final textPasswd = TextEditingController();
  int vidaUsr = 100;
  int atacUsr = 1;
  int vidaEnemy = 100;
  int atacEnemy = 10;
  

  @override

    @override
  void initState() {
    getStats();
    super.initState();
  }


  Widget build(BuildContext context) {
    // Timer.periodic(const Duration(seconds: 3), (timer){
    //   setState(() {
    //     vidaUsr = vidaUsr - atacEnemy;
    //   });
    // });
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
                          vidaEnemy = vidaEnemy - atacUsr;
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

  void getStats() async {
      // DatabaseEvent event = await firebase.ref("Enemies/0").once();
      // Map<dynamic, dynamic> value = event.snapshot.value! as Map;
      vidaEnemy = dbData.enemies["E0"]["Hp"];
      atacEnemy = dbData.enemies["E0"]["Attack"];
      // event = await firebase.ref("users/" + user.currentUser!.uid).once();
      // value = event.snapshot.value! as Map;
      int idNav = dbData.users[user.currentUser!.uid]["chosenShip"];
      // event = await firebase.ref("shop/ship/$idNav").once();
      // value = event.snapshot.value! as Map;
      atacUsr = dbData.shop["ship"][idNav]["Attack"];
      vidaUsr = dbData.shop["ship"][idNav]["Hp"];

  }
}