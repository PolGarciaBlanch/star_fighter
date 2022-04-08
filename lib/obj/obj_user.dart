import 'package:star_fighter/control/firabase_data.dart';
import 'package:star_fighter/obj/obj_clans.dart';
import 'package:star_fighter/obj/obj_custom.dart';
import 'package:star_fighter/obj/obj_mods.dart';
import 'package:star_fighter/obj/obj_ship.dart';

import '../control/image_api.dart';

class User_ {
  String id;
  String name;
  String surname;
  String alias;
  int chosenShip;
  int lvl;
  int credits;
  List<String> clan;
  List<String> friends;
  List<Custom> ships;
  List<String> modules;

  User_({
    required this.id,
    required this.name,
    required this.surname,
    required this.alias,
    required this.chosenShip,
    required this.lvl,
    required this.credits,
    required this.clan,
    required this.friends,
    required this.ships,
    required this.modules,
  });
  static User_ fromDatabaseJson(Map<String, dynamic> data, String id) {
    print("voice:" + id);
    List<String> _clan = [];
    if (data.containsKey('clan')) {
      List<Object?> clan_le = data['clan'];
      for (var i = 0; i < clan_le.length; i++) {
        _clan.add(data['clan'][i]);
      }
    }

    List<String> _friends = [];
    if (data.containsKey('friends')) {
      Map frie_le = data['friends'];
      for (var i = 0; i < frie_le.length; i++) {
        _friends.add(data['friends'][i]);
      }
    }

    List<String> _modules = [];
    if (data.containsKey('modules')) {
      List<Object?> modules_le = data['modules'];
      for (var i = 0; i < modules_le.length; i++) {
        _modules.add(data['modules'][i]);
      }
    }

    List<Custom> custom = [];
    if (data.containsKey('ships')) {
      var b = data["ships"];
      List<Object?> a = data["ships"];
      for (var i = 0; i < a.length; i++) {
        var c = b[i];
        Map d = b[i];

        List<String> _mods = [];
        if (data.containsKey('mods')) {
          List<Object?> mod_le = d['mods'];
          for (var i = 0; i < mod_le.length; i++) {
            _mods.add(d['mods'][i]);
          }
        }

        /*Map f = d["mods"];
      var mods = d['images'].map((innerMap) => innerMap['mods']).toList();*/
        print(d["alias"].toString());
        custom.add(Custom(ship: d["ship"], alias: d["alias"], mods: _mods));
      }
    }
    //Map<dynamic, dynamic> z = data["ships"];
    String name = "!No Name";
    if (data.containsKey('name')) {
      name = data['name'];
    }
    String surname = "!No Surname";
    if (data.containsKey('surname')) {
      surname = data['surname'];
    }
    String alias = "!No Alias";
    if (data.containsKey('alias')) {
      alias = data['alias'];
    }
    int chosenShip = 1;
    if (data.containsKey('chosenShip')) {
      chosenShip = data['chosenShip'];
    }
    int lvl = 0;
    if (data.containsKey('lvl')) {
      lvl = data['lvl'];
    }
    int credits = 0;
    if (data.containsKey('credits')) {
      credits = data['credits'];
    }
    print("echo:" + id);
    return User_(
        id: id,
        name: name,
        surname: surname,
        alias: alias,
        lvl: lvl,
        chosenShip: chosenShip,
        credits: credits,
        clan: _clan,
        friends: _friends,
        modules: _modules,
        ships: custom);
  }

  Map<String, dynamic> toDatabaseJson() {
    Map<String, dynamic> returnMap = Map();
    returnMap['name'] = name;
    returnMap['surname'] = surname;
    returnMap['alias'] = alias;
    returnMap['lvl'] = lvl;
    returnMap['chosenShip'] = chosenShip;
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

  static User_ genUser() {
    List<String> friendList = [];
    Custom custom = Custom(ship: "0", alias: "Martell Oxidat", mods: []);
    List<Custom> c = [custom];
    return User_(
        id: "",
        name: "",
        surname: "",
        alias: "",
        lvl: 0,
        chosenShip: 0,
        credits: 100000,
        clan: [],
        friends: friendList,
        ships: c,
        modules: []);
  }

  ImageApi imageApi = ImageApi();
  FirebaseData firebase = FirebaseData();

  NewUserInstance(User_ user) {
    firebase.NewObjWithKey(user.toDatabaseJson(), firebase.user, user.id);
    /*imageApi.UploadPlaceholder(
        "https://res.cloudinary.com/didy88ckl/image/upload/v1648710084/samples/cloudinary-group.jpg",
        imageApi.pUser,
        user.id);*/
  }

  //friends
  AddFirends(User_ user, User_ friend) {
    user.friends.add(friend.id);
    firebase.ReplaceObj(user.toDatabaseJson(), firebase.user, user.id);
  }

  RemoveFriend(User_ user, User_ friend) {
    user.friends.remove(friend.id);
    firebase.ReplaceObj(user.toDatabaseJson(), firebase.user, user.id);
  }

  //clans
  RequestJoinClan(User_ user, Clan clan) {
    if (user.clan.isEmpty) {
      user.clan.add(clan.id);
    }
  }

  JoinClan(User_ user, Clan clan) {
    if (user.clan.isEmpty) {
      user.clan.add(clan.id);
    }
  }

  LeaveClan(User_ user, Clan clan) {
    user.clan.remove(clan.id);
  }

  //Add methods
  BuyShip(User_ user, Ship ship) {
    //,{bool = false}
    user.credits = user.credits - ship.price;
    List<String> mods = [];
    Custom s = Custom(ship: ship.id, alias: ship.name, mods: mods);
    user.ships.add(s);
    firebase.ReplaceObj(user.toDatabaseJson(), firebase.user, user.id);
  }

  BuyMod(User_ user, Mod mod) {
    user.credits = user.credits - mod.price;
    user.modules.add(mod.id);
    firebase.ReplaceObj(user.toDatabaseJson(), firebase.user, user.id);
  }

  RemoveModFromShip(Custom custom, Mod mod, User_ user) {
    custom.mods.remove(mod.id);
    user.modules.add(mod.id);
    firebase.ReplaceObj(user.toDatabaseJson(), firebase.user, user.id);
  }

  AddModToShip(Custom custom, Mod mod, User_ user) {
    user.modules.remove(mod.id);
    custom.mods.add(mod.id);
    firebase.ReplaceObj(user.toDatabaseJson(), firebase.user, user.id);
  }

  UserSetShip(Custom custom, User_ user) {
    List<Custom> newList = [];
    newList.add(custom);
    user.ships.remove(custom);
    newList.addAll(user.ships);
    user.ships = newList;
    firebase.ReplaceObj(user.toDatabaseJson(), firebase.user, user.id);
  }

  ScrapShip(Custom custom, User_ user) {
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
    firebase.ReplaceObj(user.toDatabaseJson(), firebase.user, user.id);
  }

  ScrapMod(Mod mod, User_ user) {
    int value = (mod.price * 0.75).toInt();
    user.modules.remove(mod);
    firebase.ReplaceObj(user.toDatabaseJson(), firebase.user, user.id);
  }
  //sell

}
