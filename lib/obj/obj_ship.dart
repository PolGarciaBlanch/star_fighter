class Ship {
  String id;
  String name;
  int price;
  // int speed;
  // int armor;
  // int energy;

  Ship({
    required this.id,
    required this.name,
    required this.price,
    // required this.speed,
    // required this.armor,
    // required this.energy,
  });

  factory Ship.fromDatabaseJson(Map<String, dynamic> data, String id) => Ship(
      id: id,
      name: data['type_name'],
      price: data['price']);
      // speed: data['speed'],
      // armor: data['armor'],
      // energy: data['energy']);

  Map<String, dynamic> toDatabaseJson() => {
        "type_name": name,
        "price": price,
        // "speed": speed,
        // "armor": armor,
        // "energy": energy,
      };
}
