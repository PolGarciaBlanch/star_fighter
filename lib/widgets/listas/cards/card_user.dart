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
  String altPers =
      "https://res.cloudinary.com/didy88ckl/image/upload/v1649235499/Images/noFile/nouser.jpg";
  String altImg =
      "https://res.cloudinary.com/didy88ckl/image/upload/v1649235578/Images/noFile/noimage.jpg";
  ImageApi img = ImageApi();
  CardUserState(Object this.obj);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ImageFromUrl.circleImage(50, 50,
          img.imgUrl + img.pUser + (obj as dynamic).id + ".jpg", altPers),
      Container(
        margin: const EdgeInsets.only(left: 5.0),
        width: 120,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "name:" + (obj as dynamic).name,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "LVL:" + (obj as dynamic).lvl.toString(),
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                )),
          ],
        ),
      ),
      Container(
        width: 120,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "clan:" + clan(obj),
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ship:" + ship(obj),
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                )),
          ],
        ),
      )
    ]);
  }

  String clan(Object obj) {
    String value = "!NONE";
    try {
      value = ((obj as dynamic).clan[0]);
      return value;
    } catch (e) {
      return value;
    }
  }

  String ship(Object obj) {
    String value = "!NONE";
    try {
      value = ((obj as dynamic).ships[0].ship);
      return value;
    } catch (e) {
      return value;
    }
  }
}
