import 'package:flutter/material.dart';
import 'package:star_fighter/main.dart';

class PantallaCarga extends StatefulWidget {
  final String appTip;

  PantallaCarga({Key? key, required this.appTip}) : super(key: key);
  //default

  //moded

  @override
  _PantallaCargaState createState() => _PantallaCargaState(appTip);
}

class _PantallaCargaState extends State<PantallaCarga>
    with TickerProviderStateMixin {
  final String appTip;
  _PantallaCargaState(this.appTip);
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
                Image.asset(
                  'assets/img/backGround.jpg',
                  width: 500,
                  height: 1000,
                ),
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
                      Image.asset('assets/img/AppLogo.png'),
                      Container(
                        width: 300,
                        height: 300,
                        child: Image.asset('assets/img/xWing.png'),
                      ),
                      LinearProgressIndicator(
                        value: controller.value,
                        semanticsLabel: 'Linear progress indicator',
                      ),
                      Container(
                        width: 500,
                        height: 100,
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
