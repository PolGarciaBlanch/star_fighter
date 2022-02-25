import 'package:flutter/material.dart';

class CharacterStack extends StatefulWidget {
  final String text;
  final double width;
  final double height;

  CharacterStack(
      {Key? key, required this.text, required this.width, required this.height})
      : super(key: key);

  @override
  _CharacterStackState createState() =>
      _CharacterStackState(text, width, height);
}

class _CharacterStackState extends State<CharacterStack> {
  double width;
  double height;
  String text;

  _CharacterStackState(this.text, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    //String pl_name;

    return InkWell(
        //detectar click
        /*
        onTap: () {
          Navigator.pushNamed(context, 'charDetail');
        },*/
        child: Row(children: [
      //left container image
      //image is a stack
      Container(
          //margin: const EdgeInsets.only(left: 70),
          width: width,
          height: height,

          //color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(text,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          )),
    ]));
  }
}
