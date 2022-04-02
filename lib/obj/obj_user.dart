import 'dart:convert';

import 'package:star_fighter/obj/obj_custom.dart';

class User {
  String id;
  String name;
  String surname;
  String alias;
  int lvl;
  int credits;
  int chosenShip;
  List<Custom> ships;
  List<String> modules;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.alias,
    required this.lvl,
    required this.credits,
    required this.chosenShip,
    required this.ships,
    required this.modules,
  });
  static User fromDatabaseJson(Map<String, dynamic> data, String id) {
    List<Custom> custom = [
      new Custom(ship: "ship", alias: "alias", mods: ["2", "1", "3"])
    ];
    List<String> modues = [];

    return new User(
        id: id,
        name: data['name'],
        surname: data['surname'],
        alias: data['alias'],
        lvl: data['lvl'],
        credits: data['credits'],
        chosenShip: data['chosenShip'],
        modules: modues,
        ships: custom);
  }

/*
  factory User.fromDatabaseJson(Map<String, dynamic> data, String id) => User(
      id: id,
      name: data['name'],
      surname: data['surname'],
      alias: data['alias'],
      lvl: data['lvl'],
      credits: data['credits'],
      chosenShip: data['chosenShip'],
      modules: [data['modules']],
      ships: [data['ships']);
*/
  Map<String, dynamic> toDatabaseJson() {
/*
        "name": name,
        "surname": surname,
        "alias": alias,
        "lvl": lvl,
        "credits": credits,
        "chosenShip": chosenShip,
        "ships": ships,
        "modules": modules*/
    Map<String, dynamic> returnMap = new Map();
    returnMap['name'] = name;
    returnMap['surname'] = surname;
    returnMap['alias'] = alias;
    returnMap['lvl'] = lvl;
    returnMap['credits'] = credits;
    returnMap['chosenShip'] = chosenShip;
    returnMap['ships'] = ships.map((attribute) {
      Map<String, dynamic> attributeMap = new Map<String, dynamic>();
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
        id: "TEST",
        name: "name",
        surname: "surname",
        alias: "alias",
        lvl: 0,
        credits: 10000,
        chosenShip: 1,
        ships: [
          new Custom(ship: "ship", alias: "alias", mods: ["2", "1", "3"])
        ],
        modules: [
          "0",
          "1",
          "2"
        ]);
  }
  //notas de como generar user(y los demas obj)
  /*
  User k = User.genUser();  < esta funcion te genera un user rellenito de cosas modifica  el contenido a tu gusto
                              < tendras que pasarle el nombre, el id y la key que generas tu

                      Map<String, dynamic> a = k.toDatabaseJson(); < con esta funcion extraes el mapa
                      FirebaseData fd = new FirebaseData();
                      //fd.NewObj(a, "users/");  < ANTIGUA FUNCION NO LE PASAS KEY GENERA EL UNA RANDOM
                      fd.NewObjWithKey(a, "users/", "kkkkkkk");  < OBJETO, PATH, KEY: EL PATH ESTA PUESTO EN FB (fd.users)
  */
  //para guardarlo has de llamar a la fucion
  //tienes ejemplo en Developer page, Generateitems: Gen User.
}
