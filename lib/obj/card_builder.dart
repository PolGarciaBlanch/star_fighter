import 'package:flutter/cupertino.dart';
import 'package:star_fighter/widgets/listas/cards/card_text.dart';
import 'package:star_fighter/widgets/listas/cards/card_user.dart';

class CardBuilder {
  TextCard(Object obj) {
    return CardText(obj: obj);
  }

  UserCard(Object obj) {
    return CardUser(obj: obj);
  }
}
