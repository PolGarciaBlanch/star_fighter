import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardText extends StatefulWidget {
  final Object obj;

  const CardText({Key? key, required this.obj}) : super(key: key);

  @override
  CardTextState createState() => CardTextState(obj);
}

class CardTextState extends State<CardText> {
  Object obj;

  CardTextState(Object this.obj);
  @override
  Widget build(BuildContext context) {
    return Text(
      (obj as dynamic).name,
      textDirection: TextDirection.ltr,
      style: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
