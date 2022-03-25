import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/widgets/listas/basic_list.dart';

class DialogLists {
  //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  // lists generators
  //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  GenerateList(BuildContext context, List<Object> dataList, Function action,
      List<Object> targetList) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BasicList(function: action, objectList: dataList);
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
}
