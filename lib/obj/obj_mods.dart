class Mod {
  int id;
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

  factory Mod.fromDatabaseJson(Map<String, dynamic> data) => Mod(
        id: data['id'],
        name: data['name'],
        desc: data['desc'],
        price: data['price'],
        type: data['type'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "type": type,
      };
}
