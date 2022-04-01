import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/obj/nav_opt.dart';

import '../generic_container.dart';

class TrueGeneric extends StatefulWidget {
  final List<Object> objectList;
  final List<Object> targetList;
  final Function function;
  final Function card;

  TrueGeneric(
      {Key? key,
      required this.objectList,
      required this.targetList,
      required this.function,
      required this.card})
      : super(key: key);

  @override
  _OptionDisplayState createState() =>
      _OptionDisplayState(objectList, targetList, function, card);
}

class _OptionDisplayState extends State<TrueGeneric> {
  var isLoading = false;
  final List<Object> objectList;
  final List<Object> targetList;
  final Function function;
  final Function card;

  _OptionDisplayState(
      this.objectList, this.targetList, this.function, this.card);
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
          : _ListBuilder(objectList), //body: CharacterListGen(),
    );
  }

  _ListBuilder(List<Object> objList) {
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
                  Navigator.pop(context, "ok");
                  function(context, objList[index], targetList);
                },
                child: GenericContainer(child: (card as dynamic)(objList[index])
                    //chec
                    ));
          });
    }
  }
}
