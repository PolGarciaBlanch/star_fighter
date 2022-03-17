import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfInfo extends StatefulWidget {
  ConfInfo({Key? key})
      : super(key: key);

  @override
  _ConfInfoState createState() => _ConfInfoState();
}

class _ConfInfoState extends State<ConfInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de:", style: TextStyle(color: Colors.white)),
        centerTitle: false,
        backgroundColor: Colors.black,
      ),
      body: Container(
      color: Colors.yellow,
    )//body: CharacterListGen(),
    );
  }
}
