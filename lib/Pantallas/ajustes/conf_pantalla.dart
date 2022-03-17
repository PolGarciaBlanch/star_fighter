import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ConfPantalla extends StatefulWidget {
  ConfPantalla({Key? key})
      : super(key: key);

  @override
  _ConfPantallaState createState() => _ConfPantallaState();
}

class _ConfPantallaState extends State<ConfPantalla> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ajutes de Pantalla", style: TextStyle(color: Colors.white)),
          centerTitle: false,
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.yellow,
        )//body: CharacterListGen(),
    );
  }
}
