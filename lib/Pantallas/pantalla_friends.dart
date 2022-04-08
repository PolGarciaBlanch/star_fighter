import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
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
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.replay_rounded),
              onPressed: () {
                fd.GetObjFix(loggedUser, User_.fromDatabaseJson, fd.user,
                    loggedUser[0].id);
                //ApiDataTrader.initialApiLoad();
                //DBProvider.db.getAllCharacters(characters);
              },
            ),
          ],
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
                        var uidfriend = await Navigator.pushNamed(
                            context, 'pantalla_qrView');

                        if (uidfriend != null) {
                          var friend = fd.GetObj(User_.fromDatabaseJson,
                              fd.user, uidfriend.toString());
                          if (friend != null) {
                            var firebase = FirebaseDatabase.instance;
                            firebase
                                .ref("users/" +
                                    FirebaseAuth.instance.currentUser!.uid +
                                    "/friends")
                                .set({"$uidfriend": uidfriend});
                            firebase
                                .ref("users/" +
                                    uidfriend.toString() +
                                    "/friends")
                                .set({
                              "${FirebaseAuth.instance.currentUser!.uid}":
                                  FirebaseAuth.instance.currentUser!.uid
                            });
                          }
                        }
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
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  content: Container(
                                      height: 300,
                                      width: 300,
                                      child: QrImage(
                                        data: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        version: QrVersions.auto,
                                        size: 200.0,
                                      )));
                            });
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
