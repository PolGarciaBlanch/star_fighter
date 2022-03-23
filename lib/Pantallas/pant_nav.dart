import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/obj/nav_opt.dart';
import 'package:star_fighter/widgets/listas/lista_navegacion.dart';
import 'package:star_fighter/widgets/listas/lista_select.dart';
import 'package:star_fighter/widgets/load.dart';

class PantNav extends StatefulWidget {
  List<NavOpt> navOpt = listNavOpt;
  String lista = "Ajustes";
  PantNav({Key? key, required this.lista, re}) : super(key: key);

  @override
  _PantNavState createState() => _PantNavState(this.navOpt, this.lista);
}

class _PantNavState extends State<PantNav> {
  bool loading = true;
  final String lista;
  List<NavOpt> navOpt = listNavOpt;
  _PantNavState(this.navOpt, this.lista);

  void showData(Object obj) {
    String obj_data;
    /*for (ObjectKey k in obj) {
      var name = MirrorSystem.getName(v.simpleName);
 }*/
    //}
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(body: Text("lol"));
        });
  }

  void navigate(Object obj) {
    Navigator.pushNamed(context, (obj as dynamic).navigatorCode);
  }

  void _testPant_carga() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test nav opt stack"),
        ),
        body: Container(
            color: Colors.green,
            width: 500,
            child: Column(
              children: [
                Text("this is the main window stack"),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ListaNavegacion(
                              listNavOpt: navOpt,
                              lista: lista,
                              action: null,
                            );
                          });
                    },
                    child: Text("press to spawn navigation list")),
                TextButton(
                    onPressed: () {
                      _testPant_carga();
                    },
                    child: Text("test load screen")),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ListaSelect(
                                function: showData, objectList: navOpt);
                          });
                    },
                    child: Text("lista de objetos")),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ListaSelect(
                                function: navigate, objectList: navOpt);
                          });
                    },
                    child: Text("navegacion listas genericas"))
              ],
            )));
    /*
    return ListaNavegacion(
      listNavOpt: navOpt,
      lista: lista,
    );*/
  }
}
