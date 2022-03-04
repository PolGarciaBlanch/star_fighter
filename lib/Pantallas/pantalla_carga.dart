import 'dart:async';

import 'package:flutter/material.dart';
import 'package:star_fighter/widgets/load.dart';

class PantallaCarga extends StatefulWidget {

  final AssetImage backGround;
  final AssetImage imgTop;
  final AssetImage imgMid;
  final List<String> appTip;
  final String path;
  PantallaCarga(
      {Key? key,
        required this.path,
        required this.backGround,
        required this.imgTop,
        required this.imgMid,
        required this.appTip})
      : super(key: key);
  //default

  //moded

  @override
  _PantallaCargaState createState() =>
      _PantallaCargaState(path, backGround, imgTop, imgMid, appTip);
}

class _PantallaCargaState extends State<PantallaCarga>
    with TickerProviderStateMixin {

  final AssetImage backGround;
  final AssetImage imgTop;
  final AssetImage imgMid;
  final List<String> appTip;
  final String path;
  _PantallaCargaState(this.path, this.backGround, this.imgTop, this.imgMid, this.appTip);

  void _startCountDown(){
    Timer.periodic(Duration(seconds:30), (timer) {
      Navigator.pushReplacementNamed(context, 'path');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoadSplash(backGround: backGround,
      imgTop: imgTop,
      imgMid: imgMid,
      appTip: appTip)
    );}
}

/*
class PantallaCarga extends StatefulWidget {

  final AssetImage backGround;
  final AssetImage imgTop;
  final AssetImage imgMid;
  final String appTip;
  PantallaCarga(
      {Key? key,

      required this.backGround,
      required this.imgTop,
      required this.imgMid,
      required this.appTip})
      : super(key: key);
  //default

  //moded

  @override
  _PantallaCargaState createState() =>
      _PantallaCargaState( backGround, imgTop, imgMid, appTip);
}

class _PantallaCargaState extends State<PantallaCarga>
    with TickerProviderStateMixin {

  final AssetImage backGround;
  final AssetImage imgTop;
  final AssetImage imgMid;
  final String appTip;
  _PantallaCargaState( this.backGround, this.imgTop, this.imgMid, this.appTip);
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                              appTip,
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
                      )
                    ],
                  ),
                )
              ],
            ))));
  }
  
}
*/