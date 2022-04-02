class Custom {
  String ship;
  String alias;
  List<String> mods;

  Custom({
    required this.ship,
    required this.alias,
    required this.mods,
  });

  factory Custom.fromDatabaseJson(Map<String, dynamic> data) => Custom(
      ship: data['ship_id'], alias: data['alias'], mods: data['mods_id']);

  Map<String, dynamic> toDatabaseJson() {
    Map<String, dynamic> returnMap = new Map();
    returnMap['ship'] = ship;
    returnMap['alias'] = alias;
    returnMap['mods'] = mods;
    return returnMap;
    /*
    "ship_id": ship_id, 
    "alias": alias, 
    "mods_id": mods_id};*/
  }
}
