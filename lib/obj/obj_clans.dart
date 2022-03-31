class ObjClan {
  int id;
  int rank;
  String name;
  String desc;
  String leader;
  // List<String> admin;
  // List<String> member;

  ObjClan({
    required this.id,
    required this.rank,
    required this.name,
    required this.desc,
    required this.leader,
    // required this.admin,
    //required this.member,
  });

  factory ObjClan.fromDatabaseJson(Map<String, dynamic> data) => ObjClan(
        id: data['id'],
        rank: data['rank'],
        name: data['name'],
        desc: data['desc'],
        leader: data['leader'],
        //admin: data['admin'],
        //member: data['member']
      );
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
