import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math';
import 'package:star_fighter/Pantallas/pantalla_testeo.dart';
import 'package:star_fighter/control/dbData.dart';
import 'package:star_fighter/widgets/image_card.dart';
import 'package:vibration/vibration.dart';

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
  late int vidaUsr;
  late int currentHpUsr;
  late int atacUsr;
  late int vidaEnemy;
  late int currentHpEne;
  late int atacEnemy;
  var colorStatusEne = Colors.green;
  var colorStatusUsr = Colors.green;
  bool isLoading = true;
  bool stop = false;
  late Timer timer;

  @override
  @override
  void initState() {
    stop = false;
    isLoading = true;
    getStats();
    super.initState();
  }

  Widget build(BuildContext context) {
    if (!isLoading) {
      timer = Timer.periodic(const Duration(seconds: 5), (Timer t) async {
        if (stop) {
          timer.cancel();
        } else {
          currentHpUsr = currentHpUsr - atacEnemy;
          if (await Vibration.hasVibrator()) {
            Vibration.vibrate();
          }
          setState(() {
            if (currentHpUsr / vidaUsr * 100 > 50) {
              colorStatusUsr = Colors.green;
            } else if (currentHpUsr / vidaUsr * 100 < 25) {
              colorStatusUsr = Colors.red;
            } else {
              colorStatusUsr = Colors.amber;
            }
            if (currentHpUsr <= 0) {
              currentHpUsr = 0;
              stop = true;
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Derrota'),
                    content: const Text('Has sido derrotado'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          });
        }
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
                  Text(
                    'vidaEnemy: $currentHpEne',
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 300,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: currentHpEne / vidaEnemy,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(colorStatusEne),
                        backgroundColor: Color(0xffD6D6D6),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    constraints: const BoxConstraints(),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://res.cloudinary.com/didy88ckl/image/upload/v1649273184/Images/noFile/kisspng-space-invaders-pac-man-galaxian-sticker-extraterre-space-invaders-transparent-png-5a756425d85513.3069974715176427898861_odsyeu.png'))),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 300,
                    height: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: currentHpUsr / vidaUsr,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(colorStatusUsr),
                        backgroundColor: Color(0xffD6D6D6),
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
                        onPressed: () async {
                          if (await Vibration.hasVibrator()) {
                            Vibration.vibrate();
                          }
                          setState(() {
                            currentHpEne = currentHpEne - atacUsr;
                            if (currentHpEne / vidaEnemy * 100 > 50) {
                              colorStatusEne = Colors.green;
                            } else if (currentHpEne / vidaEnemy * 100 < 25) {
                              colorStatusEne = Colors.red;
                            } else {
                              colorStatusEne = Colors.amber;
                            }
                            if (currentHpEne <= 0) {
                              stop = true;
                              currentHpEne = 0;
                              var rng = Random();
                              int credits = rng.nextInt(701) + 200;
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Victoria'),
                                    content:
                                        Text('Has ganado $credits créditos'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'OK');
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
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
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  void getStats() async {
    var rng = Random();
    int idEnemy = rng.nextInt(3);
    DatabaseEvent event = await firebase.ref("Enemies/E$idEnemy").once();
    Map<dynamic, dynamic> value = event.snapshot.value! as Map;
    vidaEnemy = value["Hp"];
    currentHpEne = vidaEnemy;
    atacEnemy = value["Attack"];
    event = await firebase.ref("users/" + user.currentUser!.uid).once();
    value = event.snapshot.value! as Map;
    int idNav = value["chosenShip"];
    event = await firebase.ref("shop/ship/$idNav").once();
    //value = event.snapshot.value! as Map;
    atacUsr = 10; //value["Attack"];
    vidaUsr = 100; //value["Hp"];
    currentHpUsr = vidaUsr;
    setState(() {
      isLoading = false;
    });
  }
}
