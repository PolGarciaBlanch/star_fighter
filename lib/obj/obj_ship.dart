class Ship {
  int id;
  String name;
  int price;
  int speed;
  int armor;
  int energy;

  Ship({
    required this.id,
    required this.name,
    required this.price,
    required this.speed,
    required this.armor,
    required this.energy,
  });

  factory Ship.fromDatabaseJson(Map<String, dynamic> data) => Ship(
      id: data['id'],
      name: data['name'],
      price: data['price'],
      speed: data['speed'],
      armor: data['armor'],
      energy: data['energy']);

  Map<String, dynamic> toDatabaseJson() => {
        "id": id,
        "name": name,
        "price": price,
        "speed": speed,
        "armor": armor,
        "energy": energy,
      };
}
