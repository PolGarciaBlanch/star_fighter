import 'package:flutter/material.dart';

class PantallaMenu extends StatefulWidget {
  final List<String> text;
  final List<String> navigator;
  //final List<List<Object>> parameters;
  PantallaMenu({
    Key? key,
    required this.text,
    required this.navigator,
  }) : super(key: key);
  //default

  //moded

  @override
  _PantallaMenuState createState() => _PantallaMenuState();
}

class _PantallaMenuState extends State<PantallaMenu> {
  _PantallaMenuState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('MENU'),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //default
              Container(
                child: FlatButton(
                  color: Colors.red,
                  splashColor: Colors.black12,
                  onPressed: () {
                    Navigator.pushNamed(context, 'pantalla_carga');
                  },
                  child: const Text("Load Screen"),
                ),
                // margin: EdgeInsets.only(top: 30),
              ),
            ],
          ),
        ));
  }
}
