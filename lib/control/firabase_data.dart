import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:star_fighter/obj/obj_clans.dart';
import 'package:star_fighter/obj/obj_mods.dart';
import 'package:star_fighter/obj/obj_ship.dart';
import 'package:star_fighter/obj/obj_user.dart';

class FirebaseData {
  String clan = "clans/";
  String mods = "shop/mods/";
  String ship = "shop/ship";
  String user = "users/";
  String enemy = "Enemies/";

  List<Clan> listClan = [];
  List<Mod> listMod = [];
  List<Ship> listShip = [];
  List<User_> listUser = [];

  FirebaseDatabase firebase = FirebaseDatabase.instance;
  var referenceDatabase = FirebaseDatabase.instance;
  //GET DATA
  Future<dynamic> GetObj(Function converter, String path, String key) async {
    Object obj;
    Map<String, dynamic> temp = new Map();
    Stream<DatabaseEvent> stream = firebase.ref(path + key).onValue;
    stream.listen((DatabaseEvent event) {
      temp = Map<String, dynamic>.from(event.snapshot.value! as Map);
      /*if (temp == null) {
        return ;
      }*/
    });
    obj = converter(temp, key);

    return obj;
  }

  GetObjList(List<Object> genericList, Function converter, String path) {
    Stream<DatabaseEvent> stream = firebase.ref(path).onValue;
    stream.listen((DatabaseEvent event) {
      var temp = Map<dynamic, dynamic>.from(event.snapshot.value! as Map);
      genericList.clear();

      for (var entry in temp.entries) {
        Map<String, dynamic> submap = Map.from(entry.value);
        //new Map<String, dynamic>.from(value);
        genericList.add(converter(submap, entry.key));
      }
      print(genericList.toString());
    });
  }

  //PUSH DATA
  NewObj(Map<String, dynamic> map, String path) {
    final ref = referenceDatabase.ref();
    ref.child(path).push().set(map);
  }

  NewObjWithKey(Map<String, dynamic> map, String path, String key) {
    final ref = referenceDatabase.ref();
    ref.child(path).child(key).set(map);
  }

  DeleteObj(String path, String key) {
    final ref = referenceDatabase.ref();
    ref.child(path).child(key).remove();
  }

  ReplaceObj(Map<String, dynamic> map, String path, String key) {
    final ref = referenceDatabase.ref();
    ref.child(path).child(key).set(map);
  }
}
