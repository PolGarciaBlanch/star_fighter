import 'package:flutter/material.dart';

class PantallaTesteo extends StatefulWidget {
  PantallaTesteo({Key? key}) : super(key: key);
  //default

  //moded

  @override
  _PantallaTesteoState createState() => _PantallaTesteoState();
}

class _PantallaTesteoState extends State<PantallaTesteo> {
  _PantallaTesteoState();

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
                    Navigator.pushNamed(context, 'pantalla_carga');
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
