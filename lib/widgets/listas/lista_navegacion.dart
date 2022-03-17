//
// Lista para ejcutar navigator.push
//
// input navigation_obj(text, navigation)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/obj/nav_opt.dart';

import '../generic_container.dart';

class ListaNavegacion extends StatefulWidget {
  final List<NavOpt> listNavOpt;
  final String lista;

  ListaNavegacion({Key? key, required this.listNavOpt, required this.lista})
      : super(key: key);

  @override
  _OptionDisplayState createState() => _OptionDisplayState(listNavOpt, lista);
}

class _OptionDisplayState extends State<ListaNavegacion> {
  var isLoading = false;
  final List<NavOpt> listNavOpt;
  final String lista;
  _OptionDisplayState(this.listNavOpt, this.lista);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters!", style: TextStyle(color: Colors.white)),
        centerTitle: false,
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _ListBuilder(listNavOpt, lista), //body: CharacterListGen(),
    );
  }

  _ListBuilder(List<NavOpt> listNavOpt, String lista) {
    List<NavOpt> item =
        listNavOpt.where((i) => i.lists.contains(lista)).toList();

    if (item.length > 0) {
      ListView.separated(
          itemCount: item.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return GenericContainer(
                child: GenericContainer(
              child: Text(
                item[index].text[0],
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
              ),
            ));
          });
    }
  }
}
