import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardShip extends StatefulWidget {
  final Object obj;

  const CardShip({Key? key, required this.obj}) : super(key: key);

  @override
  CardShipState createState() => CardShipState(obj);
}

class CardShipState extends State<CardShip> {
  Object obj;

  CardShipState(Object this.obj);
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
            "Price: " + (obj as dynamic).price.toString(),
            textDirection: TextDirection.ltr,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
          Text(
            "Armor: " + (obj as dynamic).armor.toString(),
            textDirection: TextDirection.ltr,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
          Text(
            "Eenergy: " + (obj as dynamic).energy.toString(),
            textDirection: TextDirection.ltr,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
          Text(
            "Speed: " + (obj as dynamic).speed.toString(),
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
