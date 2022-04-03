import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_fighter/control/firabase_data.dart';
import 'package:star_fighter/control/image_api.dart';
import 'package:star_fighter/obj/card_builder.dart';
import 'package:star_fighter/obj/dialog_lists.dart';
import 'package:star_fighter/obj/nav_opt.dart';
import 'package:star_fighter/obj/obj_clans.dart';
import 'package:star_fighter/obj/obj_mods.dart';
import 'package:star_fighter/obj/obj_ship.dart';
import 'package:star_fighter/obj/obj_user.dart';
import 'package:star_fighter/widgets/listas/cards/card_text.dart';
import 'package:star_fighter/widgets/listas/lista_navegacion.dart';
import 'package:star_fighter/widgets/listas/basic_list.dart';
import 'package:star_fighter/widgets/load.dart';

import '../control/image_picker.dart';

class PantDev extends StatefulWidget {
  PantDev({
    Key? key,
  }) : super(key: key);

  @override
  _PantDevState createState() => _PantDevState();
}

class _PantDevState extends State<PantDev> {
  DialogLists dList = new DialogLists();
  CardBuilder cBuilder = new CardBuilder();
  ImagePickerLib imgLib = new ImagePickerLib();
  List<NavOpt> navOpt = listNavOpt;
  List<NavOpt> item = [];

  FirebaseData fd = new FirebaseData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Developer OPT"),
        ),
        body: Container(
            color: Colors.yellow,
            width: 500,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Text("Navigate:"),
                TextButton(
                    onPressed: () {
                      item = listNavOpt
                          .where((i) => i.lists.contains("Ajustes"))
                          .toList();
                      //dList.test(context, item, item);

                      dList.GenerateGenericList(context, item, item,
                          dList.navigate, cBuilder.TextCard);
                    },
                    child: Text("press to spawn navigation list [Ajustes]")),
                TextButton(
                    onPressed: () {
                      item = listNavOpt
                          .where((i) => i.lists.contains("pantalla"))
                          .toList();
                      dList.GenerateGenericList(context, item, item,
                          dList.navigate, cBuilder.TextCard);
                    },
                    child: Text("press to spawn navigation list [Pages]")),
                Text("========================="),
                Text("Test firebase:"),
                TextButton(
                    onPressed: () {
                      fd.GetObjList(
                          fd.listClan, Clan.fromDatabaseJson, fd.clan);
                      fd.GetObjList(
                          fd.listShip, Ship.fromDatabaseJson, fd.ship);
                      fd.GetObjList(fd.listMod, Mod.fromDatabaseJson, fd.mods);
                      print("lol");
                    },
                    child: Text("Load Lists()")),
                TextButton(
                    onPressed: () {
                      fd.GetObjList(
                          fd.listUser, User.fromDatabaseJson, fd.user);
                      print("lol");
                    },
                    child: Text("Load Lists User")),
                Text("========================="),
                Text("Test lists:"),
                TextButton(
                    onPressed: () {
                      dList.GenerateGenericList(context, fd.listUser,
                          fd.listUser, dList.test, cBuilder.TextCard);
                      print("lol");
                    },
                    child: Text("Load user")),
                TextButton(
                    onPressed: () {
                      dList.GenerateGenericList(context, fd.listClan,
                          fd.listClan, dList.test, cBuilder.TextCard);
                      print("lol");
                    },
                    child: Text("Load Clans")),
                TextButton(
                    onPressed: () {
                      dList.GenerateGenericList(context, fd.listMod, fd.listMod,
                          dList.test, cBuilder.TextCard);
                      print("lol");
                    },
                    child: Text("Load mods")),
                TextButton(
                    onPressed: () {
                      dList.GenerateGenericList(context, fd.listShip,
                          fd.listShip, dList.test, cBuilder.TextCard);
                      print("lol");
                    },
                    child: Text("Load ships")),
                Text("========================="),
                Text("Generate items:"),
                TextButton(
                    onPressed: () {
                      User k = User.genUser();
                      Map<String, dynamic> a = k.toDatabaseJson();
                      //fd.NewObj(a, "users/");
                      fd.NewObjWithKey(a, "users/", "fffffff");
                    },
                    child: Text("Gen User")),
                TextButton(onPressed: () {}, child: Text("Gen mod")),
                TextButton(onPressed: () {}, child: Text("Gen ship")),
                Text("========================="),
                Text("Delete items:"),
                TextButton(onPressed: () {}, child: Text("list Clans(delete)")),
                TextButton(onPressed: () {}, child: Text("list mods(delete)")),
                TextButton(onPressed: () {}, child: Text("list ships(delete)")),
                Text("========================="),
                TextButton(
                    onPressed: () {
                      fd.GetObjList(
                          fd.listShip, Ship.fromDatabaseJson, fd.ship);
                      dList.GenerateGenericList(context, fd.listShip,
                          fd.listShip, dList.test, cBuilder.TextCard);
                    },
                    child: Text("map ship's to list")),
                TextButton(
                    onPressed: () {
                      fd.GetObjList(
                          fd.listClan, Clan.fromDatabaseJson, fd.clan);
                      dList.GenerateGenericList(context, fd.listClan,
                          fd.listClan, dList.test, cBuilder.TextCard);
                    },
                    child: Text("generic getList clan list")),
                Text("Create Objects except users"),
                TextButton(
                    onPressed: () {
                      //remove function in Clan obj
                      Clan clan = Clan(
                          id: "null",
                          rank: 111,
                          name: "test",
                          desc: "test",
                          member: []);
                      //add this code for every operation w user & clan actions and all creation operations
                      Map<String, dynamic> map = clan.toDatabaseJson();
                      fd.NewObj(map, fd.clan);
                    },
                    child: Text("Create New Clan[]")),
                TextButton(onPressed: () {}, child: Text("Create New Mod[]")),
                TextButton(onPressed: () {}, child: Text("Create New Ship[]")),
                Text("========================="),
                Text("Test Select Image"),
                TextButton(
                    onPressed: () {
                      imgLib.AccCam("key", ImageApi.pClan);
                    },
                    child: Text("From camera")),
                TextButton(
                    onPressed: () {
                      imgLib.AccGalery("key", ImageApi.pClan);
                    },
                    child: Text("From file")),
                Text("Navigate: All options"),
                TextButton(
                    onPressed: () {},
                    child: Text("navegacion listas genericas")),
                Text("Navigate: All options"),
                TextButton(
                    onPressed: () {
                      dList.GenerateList(
                          context, navOpt, dList.navigate, navOpt);
                    },
                    child: Text("ListasV2"))
              ],
            ))));
    /*
    return ListaNavegacion(
      listNavOpt: navOpt,
      lista: lista,
    );*/
  }
}
