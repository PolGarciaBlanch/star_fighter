import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ConfNotif extends StatefulWidget {
  ConfNotif({Key? key})
      : super(key: key);

  @override
  _ConfNotifState createState() => _ConfNotifState();
}

class _ConfNotifState extends State<ConfNotif> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ajutes de Alertas", style: TextStyle(color: Colors.white)),
          centerTitle: false,
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.yellow,
        )//body: CharacterListGen(),
    );
  }
}
