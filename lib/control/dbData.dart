import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class dbData {
  static FirebaseAuth user = FirebaseAuth.instance;
  static FirebaseDatabase firebase = FirebaseDatabase.instance;
  static late Map<dynamic, dynamic> users, enemies, shop;
  static late DatabaseEvent event;
  static late Stream<DatabaseEvent> stream;

  static Future<bool> loadUsrs() async{
    stream = firebase.ref().onValue;
    stream.listen((event) async {
      Map<dynamic, dynamic> value = event.snapshot.value! as Map;
      users = await value["users"] as Map;
      enemies = await value["Enemies"] as Map;
      shop = await value["shop"] as Map;
    });
    return true;
  }
}
