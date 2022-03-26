import 'package:flutter/material.dart';
import 'package:star_fighter/widgets/listas/basic_list.dart';
import 'package:star_fighter/widgets/listas/true_generic.dart';

import '../widgets/load.dart';

class DialogLists {
  //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  // lists generators
  //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  // Old system
  GenerateList(BuildContext context, List<Object> dataList, Function action,
      List<Object> targetList) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BasicList(function: action, objectList: dataList);
        });
  }

  // New sistem
  GenerateGenericList(BuildContext context, List<Object> objectList,
      List<Object> targetList, Function function, Widget card) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return TrueGeneric(
              objectList: objectList,
              targetList: targetList,
              function: function,
              card: card);
        });
  }

  // generate list  with qr

  // generate  complex list

  // generate list with images

  //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  // Filter option
  //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  //filter option try get a list for every obj type and populate the complex  list generatos with a filter addon where a combo box lets you filter by words, o range if numeric
  //listNavOpt.where((i) => i.lists.contains(lista)).toList();

  //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  // lists operations
  //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  void test(BuildContext context, Object obj, List<Object> targetList) {
    String objData;
    /*for (ObjectKey k in obj) {
          var name = MirrorSystem.getName(v.simpleName);
    }*/
    //}
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Scaffold(body: Text("lol"));
        });
  }

  void navigatePop(BuildContext context, Object obj, List<Object> targetList) {
    Navigator.pop(context, (obj as dynamic).navigatorCode);
  }

  void navigate(BuildContext context, Object obj, List<Object> targetList) {
    Navigator.pushNamed(context, (obj as dynamic).navigatorCode);
  }

  void MuestraDetalle(
      BuildContext context, Object obj, List<Object> targetList) {
    /* switch () {
     case :
       
       break;
     default:
   }*/
  }
/*
  void ModifyInList(
      BuildContext context, Object obj, List<Object> targetList) {

      }*/
  void AddToList(BuildContext context, Object obj, List<Object> targetList) {
    targetList.add(obj);
  }

  void RemoveFromList(
      BuildContext context, Object obj, List<Object> targetList) {
    bool removed = false;
    for (var i = 0; i < targetList.length; i++) {
      if (identical(targetList[i], obj)) {
        removed = true;
        targetList.removeAt(i);
      }
    }
    // popup not found?
  }

  void _testPant_carga(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
              body: LoadSplash(
            appTip: [
              'Emp missiles disrupt electronic counter-measures but are vulnerable to flak!',
              'Meteorites and proyectiles ignore shields',
              'Shield tecnology protects from plasma'
            ],
            backGround: AssetImage('assets/img/backGround.jpg'),
            imgMid: AssetImage('assets/img/xWing.png'),
            imgTop: AssetImage('assets/img/AppLogo.png'),
          ));
        });
  }
}
