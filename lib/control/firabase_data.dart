import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:star_fighter/obj/obj_clans.dart';
import 'package:star_fighter/obj/obj_mods.dart';
import 'package:star_fighter/obj/obj_ship.dart';
import 'package:star_fighter/obj/obj_user.dart';

class FirebaseData {
  List<Clan> listClan = [];
  List<Mod> listMod = [];
  List<Ship> listShip = [];
  List<User> listPerson = [];

  FirebaseDatabase firebase = FirebaseDatabase.instance;
  //GET DATA
  GetObj(Function converter, String refererence, String key) {
    Object obj;
    Stream<DatabaseEvent> stream =
        firebase.ref(refererence + "/" + key).onValue;
    stream.listen((DatabaseEvent event) {
      Map<String, dynamic> temp =
          Map<String, dynamic>.from(event.snapshot.value! as Map);
      if (temp == null) {
        return null;
      }
      return obj = converter(temp, key);
    });
  }

  GetObjList(List<Object> genericList, Function converter, String refererence) {
    Stream<DatabaseEvent> stream = firebase.ref(refererence).onValue;
    stream.listen((DatabaseEvent event) {
      Map<String, dynamic> temp =
          Map<String, dynamic>.from(event.snapshot.value! as Map);
      listClan.clear();

      for (var entry in temp.entries) {
        Map<String, dynamic> submap = Map.from(entry.value);
        //new Map<String, dynamic>.from(value);
        genericList.add(converter(submap, entry.key));
      }
      print(genericList.toString());
    });
  }

  //PUSH DATA
  NewObj(Object obj, String reference) {}

  DeleteObj(Object obj, String reference, String key) {}
  ReplaceObj(Object obj, String reference, String key) {
    DeleteObj(obj, reference, key);
    NewObj(obj, reference);
  }

  GenerateKey(String reference) {}
//--------------------------------------------------------------------
  GetClanList() {
    Stream<DatabaseEvent> stream = firebase.ref("clans/").onValue;
    stream.listen((DatabaseEvent event) {
      Map<String, dynamic> temp =
          Map<String, dynamic>.from(event.snapshot.value! as Map);
      listClan.clear();
/*
      for (var entry in temp.entries) {
        Map<String, dynamic> submap = Map.from(entry.value);
        //new Map<String, dynamic>.from(value);
        listClan.add(Clan.fromDatabaseJson(submap, entry.key));
      }*/
      for (var entry in temp.entries) {
        Map<String, dynamic> submap = Map.from(entry.value);
        //new Map<String, dynamic>.from(value);
        listClan.add(Clan.fromDatabaseJson(submap, entry.key));
      }

      int a = listClan.length;
    });
  }

  GetMods() {}
  GetShips() {}
  GetPersons() {}
}

class CustomData {
  CustomData({required this.app});
  final FirebaseApp app;
  final referenceDatabase = FirebaseDatabase.instance;

  Test() {
    final ref = referenceDatabase.ref();
  }

  testSet() {
    final ref = referenceDatabase.ref();
    ref.child('shop').push().child('mods').set("test").asStream();
  }

  //read
  /**
   *  Stream<DatabaseEvent> stream =
          firebase.ref("users/" + userCredential.user!.uid).onValue;
      stream.listen((DatabaseEvent event) {
        setState(() {
          Map<dynamic, dynamic> value = event.snapshot.value! as Map;
          value["level"].toString()),
   */

}


  //write

  //lists

