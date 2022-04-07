import 'package:flutter/cupertino.dart';

List<NavOpt> listNavOpt = [
  //ajustes
  NavOpt(lists: ["Ajustes"], name: "Perfil", navigatorCode: "confPerfil"),
  NavOpt(lists: ["Ajustes"], name: "Notificacions", navigatorCode: "conf_info"),
  NavOpt(
      lists: ["Ajustes"],
      name: "configuració de visualització",
      navigatorCode: "conf_info"),
  NavOpt(
      lists: ["Ajustes"],
      name: "configuració de volum",
      navigatorCode: "conf_info"),
  NavOpt(lists: ["Ajustes"], name: "Informació", navigatorCode: "conf_info"),
  NavOpt(lists: ["pantalla"], name: "Login", navigatorCode: "pantalla_login"),
  NavOpt(
      lists: ["pantalla"],
      name: "Crear Usuario",
      navigatorCode: "pantalla_crea_usr"),
  NavOpt(
      lists: ["pantalla"],
      name: "Pantalla principal",
      navigatorCode: "pantalla_principal"),
  NavOpt(
      lists: ["pantalla"],
      name: "Pantalla QRView",
      navigatorCode: "pantalla_qrView"),
  NavOpt(
      lists: ["pantalla"],
      name: "Pantalla QRShow",
      navigatorCode: "pnatalla_qrShow"),

  NavOpt(
      lists: ["pantalla"],
      name: "Pantalla QRShow",
      navigatorCode: "pantalla_testeo"),
];

class NavOpt {
  List<String> lists;
  String name;
  String navigatorCode;
  List<Object>? parameters;

  NavOpt(
      {required this.lists,
      required this.name,
      required this.navigatorCode,
      this.parameters});
  NavOpt.fromForm(this.lists, this.name, this.navigatorCode, this.parameters);

  _navigate(String path, context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false);
  }
}
/*
class NavOptList{

  void InitNavigationOpt(List<NavOpt>listNavOpt){

    listNavOpt.add(NavOpt(lists: ["Ajustes"], text: ["Perfil"],         navigatorCode: "conf_perfil"));
    listNavOpt.add(NavOpt(lists: ["Ajustes"], text: ["Notificaciones"], navigatorCode: "conf_notif"));
    listNavOpt.add(NavOpt(lists: ["Ajustes"], text: ["Pantalla"],       navigatorCode: "conf_pantalla"));
    listNavOpt.add(NavOpt(lists: ["Ajustes"], text: ["Audio"],          navigatorCode: "conf_audio"));
    listNavOpt.add(NavOpt(lists: ["Ajustes"], text: ["Acerda de:"],     navigatorCode: "conf_info"));
  }
}

 */