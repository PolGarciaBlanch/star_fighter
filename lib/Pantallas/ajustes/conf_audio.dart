import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ConfAudio extends StatefulWidget {
  ConfAudio({Key? key})
      : super(key: key);

  @override
  _ConfAudioState createState() => _ConfAudioState();
}

class _ConfAudioState extends State<ConfAudio> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ajutes de Audio", style: TextStyle(color: Colors.white)),
          centerTitle: false,
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.yellow,
        )//body: CharacterListGen(),
    );
  }
}
