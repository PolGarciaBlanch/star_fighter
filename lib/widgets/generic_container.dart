import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenericContainer extends StatefulWidget {
  final Widget child;

  const GenericContainer({Key? key, required this.child}) : super(key: key);

  @override
  GenericContainerState createState() => GenericContainerState();
}

class GenericContainerState extends State<GenericContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          margin: const EdgeInsets.all(20.0),
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: widget.child,
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.black),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4.0, 4.0),
                  )
                ]),
          ),
        )
      ],
    );
  }
}
