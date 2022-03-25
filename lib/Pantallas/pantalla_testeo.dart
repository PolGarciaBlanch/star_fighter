import 'package:flutter/material.dart';
import 'package:star_fighter/Pantallas/pantalla_principal.dart';
import 'package:star_fighter/Pantallas/pantalla_scanqr.dart';
import 'package:star_fighter/Pantallas/pantalla_qr.dart';

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



                    Navigator.push(context,  MaterialPageRoute(builder: (context) => QRShow()),);

                  },
                  child: Text("QR"),
                ),
                // margin: EdgeInsets.only(top: 30),
              ),
              Container(
                child: FlatButton(
                  color: Colors.red,
                  splashColor: Colors.black12,
                  onPressed: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => QRView()),);
                  },
                  child: Text("Scan"),
                ),
                // margin: EdgeInsets.only(top: 30),
              ),
            ],
          ),
        ));
  }
}
