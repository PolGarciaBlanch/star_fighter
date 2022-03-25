import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ConfPerfil extends StatefulWidget {
  ConfPerfil({Key? key})
      : super(key: key);

  @override
  _ConfPerfilState createState() => _ConfPerfilState();
}

class _ConfPerfilState extends State<ConfPerfil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ajustes de Perfil", style: TextStyle(color: Colors.white)),
          centerTitle: false,
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.yellow,
        )//body: CharacterListGen(),
    );
  }
}
