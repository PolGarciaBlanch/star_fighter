class Clan {
  String id;
  int rank;
  String name;
  String desc;
  int leader;
  // List<String> admin;
  // List<String> member;

  Clan({
    required this.id,
    required this.rank,
    required this.name,
    required this.desc,
    required this.leader,
    // required this.admin,
    //required this.member,
  });
  factory Clan.fromDatabaseJson(Map<String, dynamic> data, String id) => Clan(
        id: id,
        rank: data['rank'],
        name: data['name'],
        desc: data['desc'],
        leader: data['leader'],
        //admin: data['admin'],
        //member: data['member']
      ); /*
  factory Clan.fromDatabaseJson(Map<String, dynamic> data, String id) => Clan(
        id: id,
        rank: data['rank'],
        name: data['name'],
        desc: data['desc'],
        leader: data['leader'],
        //admin: data['admin'],
        //member: data['member']
      );*/
  Map<String, dynamic> toDatabaseJson() => {
        "id": id,
        "rank": rank,
        "name": name,
        "desc": desc,
        "leader": leader,
        //
        //
      };
}
