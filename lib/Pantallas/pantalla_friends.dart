import 'package:flutter/material.dart';
import 'package:star_fighter/obj/obj_user.dart';

class lAmics extends StatefulWidget {
  const lAmics({Key? key}) : super(key: key);

  @override
  _list_usr createState() => _list_usr();
}

class _list_usr extends State<lAmics> {
  var isLoading = false;
  List<User_> friendList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Llista amics'),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      textStyle: const TextStyle(fontSize: 25)),
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, 'pantalla_qrView');
                    //carga_test
                  },
                  child: const Text('Captura QR'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      textStyle: const TextStyle(fontSize: 25)),
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, 'pnatalla_qrShow');
                  },
                  child: const Text('Mostra QR'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      textStyle: const TextStyle(fontSize: 25)),
                  onPressed: () async {
                    //carga_test
                  },
                  child: const Text('Llista Amics'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      textStyle: const TextStyle(fontSize: 25)),
                  onPressed: () async {
                    //carga_test
                  },
                  child: const Text('Llista Usuaris'),
                ),
              ),
            ),
          ],
        )));
  }
}
