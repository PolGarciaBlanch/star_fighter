import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/control/image_api.dart';

import '../../image_card.dart';

class CardUser extends StatefulWidget {
  final Object obj;

  const CardUser({Key? key, required this.obj}) : super(key: key);

  @override
  CardUserState createState() => CardUserState(obj);
}

class CardUserState extends State<CardUser> {
  Object obj;

  CardUserState(Object this.obj);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ImageFromUrl.digimonImage(
        50,
        50,
        ImageApi.URL,
      ),
      Text(
        (obj as dynamic).name,
        textDirection: TextDirection.ltr,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.yellow),
      ),
    ]);
  }
}
