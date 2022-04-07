import 'package:flutter/material.dart';

class PantallaInfo extends StatefulWidget {
  PantallaInfo({
    Key? key,
  }) : super(key: key);
  //default

  //moded

  @override
  _PantallaInfoState createState() => _PantallaInfoState();
}

class _PantallaInfoState extends State<PantallaInfo> {
  _PantallaInfoState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Informació'),
          backgroundColor: Colors.black,
          actions: <Widget>[],
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Text("StarFighter Alpha 1.0.0.0.1-b")),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, 'pantalla_developer');
                      },
                      child: Text("[Developer tests]"))),
            ],
          ),
        ));
  }
}
