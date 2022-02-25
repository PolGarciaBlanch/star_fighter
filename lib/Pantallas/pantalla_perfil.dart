import 'package:flutter/material.dart';

class PantallaPerfil extends StatefulWidget {
  PantallaPerfil({Key? key}) : super(key: key);
  //default

  //moded

  @override
  _PantallaPerfilState createState() => _PantallaPerfilState();
}

class _PantallaPerfilState extends State<PantallaPerfil> {
  _PantallaPerfilState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('TEST MODE'),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.update),
              onPressed: () {},
            )
          ],
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
