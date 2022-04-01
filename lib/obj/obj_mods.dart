class Mod {
  String id;
  String name;
  String desc;
  int price;
  String type;

  Mod({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.type,
  });

  factory Mod.fromDatabaseJson(Map<String, dynamic> data, String id) => Mod(
        id: id,
        name: data['name'],
        desc: data['desc'],
        price: data['price'],
        type: data['type'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "name": name,
        "desc": desc,
        "price": price,
        "type": type,
      };
}
