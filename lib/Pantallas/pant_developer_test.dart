import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_fighter/control/firabase_data.dart';
import 'package:star_fighter/obj/card_builder.dart';
import 'package:star_fighter/obj/dialog_lists.dart';
import 'package:star_fighter/obj/nav_opt.dart';
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
  CustomData FirebaseIOLib = CustomData(app: Firebase.app());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Developer OPT"),
        ),
        body: Container(
            color: Colors.yellow,
            width: 500,
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
                Text("Test firegase get"),
                TextButton(
                    onPressed: () {
                      FirebaseIOLib.testSet();
                    },
                    child: Text("test set new data to database")),
                Text("Test Select Image"),
                TextButton(
                    onPressed: () {
                      imgLib.AccCam();
                    },
                    child: Text("From camera")),
                TextButton(
                    onPressed: () {
                      imgLib.AccGalery();
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
            )));
    /*
    return ListaNavegacion(
      listNavOpt: navOpt,
      lista: lista,
    );*/
  }
}
