import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardIcon extends StatefulWidget {
  final Object obj;

  const CardIcon({Key? key, required this.obj}) : super(key: key);

  @override
  CardIconState createState() => CardIconState(obj);
}

class CardIconState extends State<CardIcon> {
  Object obj;

  CardIconState(Object this.obj);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (obj as dynamic).icono,
        Text(
          (obj as dynamic).text[0],
          textDirection: TextDirection.ltr,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.yellow),
        ),
      ],
    );
  }
}
