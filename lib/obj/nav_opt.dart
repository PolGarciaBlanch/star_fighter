import 'package:flutter/cupertino.dart';

List<NavOpt> listNavOpt = [
  //ajustes
  NavOpt(lists: ["Ajustes"], text: ["Perfil"], navigatorCode: "confPerfil"),
  NavOpt(
      lists: ["Ajustes"], text: ["Notificaciones"], navigatorCode: "confNotif"),
  NavOpt(lists: ["Ajustes"], text: ["Pantalla"], navigatorCode: "confPantalla"),
  NavOpt(lists: ["Ajustes"], text: ["Audio"], navigatorCode: "confAudio"),
  NavOpt(lists: ["Ajustes"], text: ["Acerda de:"], navigatorCode: "confInfo"),
  NavOpt(
      lists: ["Ajustes"], text: ["Notificaciones"], navigatorCode: "confNotif"),
  NavOpt(lists: ["Ajustes"], text: ["Pantalla"], navigatorCode: "confPantalla"),
  NavOpt(lists: ["Ajustes"], text: ["Audio"], navigatorCode: "confAudio"),
  NavOpt(lists: ["Ajustes"], text: ["Acerda de:"], navigatorCode: "confInfo")
];

class NavOpt {
  List<String> lists;
  List<String> text;
  String navigatorCode;
  List<Object>? parameters;

  NavOpt(
      {required this.lists,
      required this.text,
      required this.navigatorCode,
      this.parameters});
  NavOpt.fromForm(this.lists, this.text, this.navigatorCode, this.parameters);

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