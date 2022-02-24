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

class _PantallaCargaState extends State<PantallaCarga> {
  final String appTip;
  _PantallaCargaState(this.appTip);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('assets/img/backGroung.jpg'),
        Container(
          padding: EdgeInsets.all(20),
          width: 500,
          height: 800,
          color: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(image: pizzaAsset, width: 400, height: 400),
              Image.asset('assets/img/backGroung.jpg'),
              Image.asset('assets/img/backGroung.jpg'),
              Container(
                width: 80,
                height: 20,
                child: Text(
                  appTip,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    border: Border.all(color: Colors.black),
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
    ));
  }
}
