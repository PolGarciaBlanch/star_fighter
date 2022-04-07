import 'package:flutter/material.dart';
import 'package:star_fighter/control/dbData.dart';
import 'package:star_fighter/control/firabase_data.dart';
import 'package:star_fighter/main.dart';
import 'package:star_fighter/obj/card_builder.dart';
import 'package:star_fighter/obj/dialog_lists.dart';
import 'package:star_fighter/obj/obj_user.dart';

class lAmics extends StatefulWidget {
  const lAmics({Key? key}) : super(key: key);

  @override
  _list_usr createState() => _list_usr();
}

class _list_usr extends State<lAmics> {
  var isLoading = false;
  List<User_> friendList = [];
  DialogLists dList = DialogLists();
  FirebaseData fd = FirebaseData();
  CardBuilder cBuilder = CardBuilder();
  List<User_> friend = [];
  List<User_> users = [];

  @override
  void initState() {
    fd.GetObjList(fd.listUser, User_.fromDatabaseJson, fd.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Llista amics'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          textStyle: const TextStyle(fontSize: 25)),
                      onPressed: () async {
                        Navigator.pushNamed(context, 'pantalla_qrView');
                        //carga_test
                      },
                      child: const Text('Captura QR'),
                    ),
                  )),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          textStyle: const TextStyle(fontSize: 25)),
                      onPressed: () async {
                        Navigator.pushNamed(context, 'pantalla_qrShow');
                      },
                      child: const Text('Mostra QR'),
                    ),
                  ),
                )),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: SizedBox(
                    width: 300,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          textStyle: const TextStyle(fontSize: 25)),
                      onPressed: () async {
                        //carga_test
                        friend = fd.listUser
                            .where((i) => loggedUser[0].friends.contains(i.id))
                            .toList();
                        dList.GenerateGenericList(context, friend, fd.listUser,
                            dList.test, cBuilder.UserCard);
                        print("lol");
                      },
                      child: const Text('Llista Amics'),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: SizedBox(
                width: 300,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      textStyle: const TextStyle(fontSize: 25)),
                  onPressed: () async {
                    //carga_test

                    print("lol");
                    dList.GenerateGenericList(context, fd.listUser,
                        loggedUser[0].friends, dList.addId, cBuilder.UserCard);
                    print("lol");
                  },
                  child: const Text('Llista Usuaris'),
                ),
              ),
            ),
          ],
        )));
  }
}
