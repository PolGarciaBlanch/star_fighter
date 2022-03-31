import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardMod extends StatefulWidget {
  final Object obj;

  const CardMod({Key? key, required this.obj}) : super(key: key);

  @override
  CardModState createState() => CardModState(obj);
}

class CardModState extends State<CardMod> {
  Object obj;

  CardModState(Object this.obj);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_alarms),
        Column(children: [
          Text(
            "Name: " + (obj as dynamic).name,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
          Text(
            "Type: " + (obj as dynamic).type,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
          Text(
            "Price: " + (obj as dynamic).name.toString(),
            textDirection: TextDirection.ltr,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
        ])
      ],
    );
  }
}
