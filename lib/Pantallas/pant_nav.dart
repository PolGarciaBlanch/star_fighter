import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/obj/nav_opt.dart';
import 'package:star_fighter/widgets/listas/lista_navegacion.dart';

class PantNav extends StatefulWidget {
  List<NavOpt> navOpt = listNavOpt;
  String lista = "Ajustes";
  PantNav({Key? key, required this.lista, re}) : super(key: key);

  @override
  _PantNavState createState() => _PantNavState(this.navOpt, this.lista);
}

class _PantNavState extends State<PantNav> {
  final String lista;
  List<NavOpt> navOpt = listNavOpt;
  _PantNavState(this.navOpt, this.lista);

  @override
  Widget build(BuildContext context) {
    return ListaNavegacion(
      listNavOpt: navOpt,
      lista: lista,
    );
  }
}
