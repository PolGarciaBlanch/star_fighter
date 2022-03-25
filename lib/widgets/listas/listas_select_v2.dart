//
// lista simple generica donde se el pasa el objeto  e imprime una lista con el campo texto,
// imputs
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/obj/nav_opt.dart';

import '../generic_container.dart';

class ListaV2 extends StatefulWidget {
  final List<Object> objectList;
  final Function function;

  ListaV2({Key? key, required this.objectList, required this.function})
      : super(key: key);

  @override
  _OptionDisplayState createState() =>
      _OptionDisplayState(objectList, function);
}

class _OptionDisplayState extends State<ListaV2> {
  var isLoading = false;
  final List<Object> objectList;
  final Function function;

  _OptionDisplayState(this.objectList, this.function);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("", style: TextStyle(color: Colors.white)),
          centerTitle: false,
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushNamed(context, 'charAdd');
              },
            ),
          ]),
      backgroundColor: Colors.yellow,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _ListBuilder(listNavOpt), //body: CharacterListGen(),
    );
  }

  _ListBuilder(List<Object> objList) {
    //List<NavOpt> item =
    //listNavOpt.where((i) => i.lists.contains(lista)).toList();
    if (objList.length == 0) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.separated(
          itemCount: objList.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  function(objList[index]);
                },
                child: GenericContainer(
                  child: Text(
                    //check
                    (objList[index] as dynamic).text[0],
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

/*
showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ListaSelect(
                                function: showData, objectList: navOpt);
                          });*/