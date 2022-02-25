import 'package:flutter/material.dart';

class PantallaPrincipal extends StatefulWidget {
  PantallaPrincipal({Key? key}) : super(key: key);
  //default

  //moded

  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  _PantallaPrincipalState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TEST MODE'),
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
                    Navigator.pushNamed(context, 'pantallaMenu');
                  },
                  child: Text("Load Screen"),
                ),
                // margin: EdgeInsets.only(top: 30),
              ),
            ],
          ),
        ));
  }
}
