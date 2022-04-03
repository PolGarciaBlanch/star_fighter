import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:star_fighter/obj/obj_clans.dart';
import 'package:star_fighter/obj/obj_custom.dart';
import 'package:star_fighter/obj/obj_mods.dart';
import 'package:star_fighter/obj/obj_ship.dart';

class User {
  String id;
  String name;
  String surname;
  String alias;
  int lvl;
  int credits;
  List<String> clan;
  List<String> friends;
  List<Custom> ships;
  List<String> modules;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.alias,
    required this.lvl,
    required this.credits,
    required this.clan,
    required this.friends,
    required this.ships,
    required this.modules,
  });
  static User fromDatabaseJson(Map<String, dynamic> data, String id) {
    List<String> _clan = [];
    List<Object?> clan_le = data['friends'];
    for (var i = 0; i < clan_le.length; i++) {
      _clan.add(data['friends'][i]);
    }

    List<String> _friends = [];
    List<Object?> fre_le = data['friends'];
    for (var i = 0; i < fre_le.length; i++) {
      _friends.add(data['friends'][i]);
    }

    List<String> _mods = [];
    List<Object?> mod_le = data['modules'];
    for (var i = 0; i < mod_le.length; i++) {
      _mods.add(data['modules'][i]);
    }

    List<Custom> custom = [];
    var b = data["ships"];
    List<Object?> a = data["ships"];
    for (var i = 0; i < a.length; i++) {
      var c = b[i];
      Map d = b[i];

      List<String> _mods = [];
      List<Object?> mod_le = d['modules'];
      for (var i = 0; i < mod_le.length; i++) {
        _mods.add(data['modules'][i]);
      }

      /*Map f = d["mods"];
      var mods = d['images'].map((innerMap) => innerMap['mods']).toList();*/
      print(d["alias"].toString());
      custom.add(new Custom(ship: d["ship"], alias: d["alias"], mods: _mods));
    }
    //Map<dynamic, dynamic> z = data["ships"];

    List<String> modues = [];
    print("echo");
    return User(
        id: id,
        name: data['name'],
        surname: data['surname'],
        alias: data['alias'],
        lvl: data['lvl'],
        credits: data['credits'],
        clan: _clan,
        friends: _friends,
        modules: _mods,
        ships: custom);
  }

  Map<String, dynamic> toDatabaseJson() {
    Map<String, dynamic> returnMap = Map();
    returnMap['name'] = name;
    returnMap['surname'] = surname;
    returnMap['alias'] = alias;
    returnMap['lvl'] = lvl;
    returnMap['credits'] = credits;
    returnMap['clan'] = clan;
    returnMap['friends'] = friends;
    returnMap['ships'] = ships.map((attribute) {
      Map<String, dynamic> attributeMap = Map<String, dynamic>();
      attributeMap["alias"] = attribute.alias;
      attributeMap["mods"] = attribute.mods;
      attributeMap["ship"] = attribute.ship;

      return attributeMap;
    }).toList();
    returnMap['modules'] = modules;

    return returnMap;
  }

  //llama esta funcion para crear usuarios modifica nombres y lvl y has de poenr el id

  static User genUser() {
    return new User(
        id: "",
        name: "",
        surname: "",
        alias: "",
        lvl: 0,
        credits: 100000,
        clan: [],
        friends: [],
        ships: [],
        modules: []);
  }

  //friends
  static AddFirends(User user, User friend) {
    user.friends.add(friend.id);
  }

  static RemoveFriend(User user, User friend) {
    user.friends.remove(friend.id);
  }

  //clans
  static RequestJoinClan(User user, Clan clan) {
    if (user.clan.isEmpty) {
      user.clan.add(clan.id);
    }
  }

  static JoinClan(User user, Clan clan) {
    if (user.clan.isEmpty) {
      user.clan.add(clan.id);
    }
  }

  static LeaveClan(User user, Clan clan) {
    user.clan.remove(clan.id);
  }

  //Add methods
  static BuyShip(User user, Ship ship) {
    //,{bool = false}
    user.credits = user.credits - ship.price;
    List<String> mods = [];
    Custom s = new Custom(ship: ship.id, alias: ship.name, mods: mods);
    user.ships.add(s);
  }

  static BuyMod(User user, Mod mod) {
    user.credits = user.credits - mod.price;
    user.modules.add(mod.id);
  }

  static RemoveModFromShip(Custom custom, Mod mod, User user) {
    custom.mods.remove(mod.id);
    user.modules.add(mod.id);
  }

  static AddModToShip(Custom custom, Mod mod, User user) {
    user.modules.remove(mod.id);
    custom.mods.add(mod.id);
  }

  static UserSetShip(Custom custom, User user) {
    List<Custom> newList = [];
    newList.add(custom);
    user.ships.remove(custom);
    newList.addAll(user.ships);
    user.ships = newList;
  }

  static ScrapShip(Custom custom, User user) {
    int credits = 0;
    //get ship
    //get list of mods

    List<Mod> mods = [];
    mods.forEach((element) {
      credits += element.price;
    });
    if (credits < 0) {
      credits = 0;
    }
    user.credits = user.credits + (credits * 0.75).toInt();
    user.ships.remove(custom);
  }

  static ScrapMod(Mod mod, User user) {
    int value = (mod.price * 0.75).toInt();
    user.modules.remove(mod);
  }
  //sell

}
