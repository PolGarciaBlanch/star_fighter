class UserLogged {
  String user_name;
  String level;

  UserLogged({required this.user_name, required this.level});

  factory UserLogged.fromDatabaseJson(Map<String, dynamic> data) => UserLogged(
        user_name: data['user_name'],
        level: data['level'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "user_name": user_name,
        "level": level,
      };
}