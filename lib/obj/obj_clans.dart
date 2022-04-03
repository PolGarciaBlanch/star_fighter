import 'package:star_fighter/obj/obj_user.dart';

class Clan {
  String id;
  int rank;
  String name;
  String desc;
  List<String> member;
  // List<String> admin;
  // List<String> member;

  Clan({
    required this.id,
    required this.rank,
    required this.name,
    required this.desc,
    required this.member,
    // required this.admin,
    //required this.member,
  });
  static Clan fromDatabaseJson(Map<String, dynamic> data, String id) {
    List<String> _member = [];
    List<Object?> member_le = data['member'];
    for (var i = 0; i < member_le.length; i++) {
      _member.add(data['member'][i]);
    }

    return Clan(
        id: id,
        rank: data['rank'],
        name: data['name'],
        desc: data['desc'],
        member: _member
        //admin: data['admin'],
        //member: data['member']
        );
  }

  Map<String, dynamic> toDatabaseJson() {
    Map<String, dynamic> returnMap = Map();
    returnMap['rank'] = rank;
    returnMap['name'] = name;
    returnMap['desc'] = desc;
    returnMap['member'] = member;

    return returnMap; //
  }

  static Clan genClan(User user) {
    return Clan(id: "", rank: 0, name: "aaa", desc: "", member: [user.id]);
  }
  //crear clan
  // añadir persona?
  // etc..

}
