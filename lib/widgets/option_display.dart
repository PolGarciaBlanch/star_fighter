import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/widgets/generic_container.dart';

class OptionDisplay extends StatefulWidget {
  final Widget container;
  final List<Widget> cards;
  OptionDisplay({Key? key, required this.container, required this.cards})
      : super(key: key);

  @override
  _OptionDisplayState createState() => _OptionDisplayState(container, cards);
}

class _OptionDisplayState extends State<OptionDisplay> {
  var isLoading = false;
  final Widget container;
  final List<Widget> cards;
  _OptionDisplayState(this.container, this.cards);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters!", style: TextStyle(color: Colors.white)),
        centerTitle: false,
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _ListBuilder(container, cards), //body: CharacterListGen(),
    );
  }

  _ListBuilder(Widget container, List<Widget> cards) {
    if (cards.length > 0) {
      ListView.separated(
          itemCount: cards.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return GenericContainer(child: cards[index]);
          });
    }
  }
}
