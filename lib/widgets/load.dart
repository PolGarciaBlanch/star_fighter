import 'dart:async';
import 'package:flutter/material.dart';
import 'package:star_fighter/control/random.dart';

class LoadSplash extends StatefulWidget {
/*
List<String> msgCarga = [
      'Emp missiles disrupt electronic counter-measures but are vulnerable to flak!',
      'Meteorites and proyectiles ignore shields',
      'Shield tecnology protects from plasma'
    ];

    List<String> menuText = ["Perfil"];
    List<String> menuNavigator = ["pantalla_perfil"];
    AssetImage imgLogo = const AssetImage('assets/img/AppLogo.png');
    AssetImage imgBackground = const AssetImage('assets/img/backGround.jpg');
    AssetImage imgShip = const AssetImage('assets/img/xWing.png'); */
  final AssetImage backGround;
  final AssetImage imgTop;
  final AssetImage imgMid;
  final List<String> appTip;
  const LoadSplash(
      {Key? key,
      required this.backGround,
      required this.imgTop,
      required this.imgMid,
      required this.appTip})
      : super(key: key);

  @override
  _LoadSplashState createState() =>
      _LoadSplashState(backGround, imgTop, imgMid, appTip);
}

class _LoadSplashState extends State<LoadSplash> with TickerProviderStateMixin {
  final AssetImage backGround;
  final AssetImage imgTop;
  final AssetImage imgMid;
  final List<String> appTip;

  _LoadSplashState(this.backGround, this.imgTop, this.imgMid, this.appTip);

  late AnimationController controller;
  late String tip = '';

  @override
  void initState() {
    //tip= appTip[RandomLib.RandomVal(0,appTip.length)];
    //tip='';
    //Future(() => UpdateTip());
    _startCountDown();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  void _startCountDown() {
    if (tip == '') {
      tip = appTip[RandomLib.RandomVal(0, appTip.length)];
    }
    Timer.periodic(Duration(seconds: 5), (timer) {
      tip = appTip[RandomLib.RandomVal(0, appTip.length)];
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        height: 800,
        color: Colors.black,
        child: (Stack(
          children: [
            Image(image: backGround, width: 500, height: 1000),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 50, right: 20, bottom: 20),
              width: 800,
              height: 800,
              color: Colors.red.withOpacity(0.02),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image(image: imgTop),
                  Container(
                    width: 300,
                    height: 300,
                    child: Image(image: imgMid),
                  ),
                  LinearProgressIndicator(
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                  Container(
                    width: 500,
                    height: 100,
                    padding: const EdgeInsets.only(
                        left: 20, top: 5, right: 20, bottom: 5),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          tip,
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow),
                        )),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        border: Border.all(color: Colors.yellow),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                          )
                        ]),
                  ),
                  LinearProgressIndicator(
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
