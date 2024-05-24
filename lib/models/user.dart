class User {
  String userId;
  String name;
  String position;
  String plaza;
  String level;

  User({
    required this.userId,
    required this.name,
    required this.position,
    required this.plaza,
    required this.level,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value == null) {
        json[key] = '';
      }
    });

    return User(
      name: json['name'],
      position: json['position'],
      plaza: json['plaza'],
      level: json['level'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'position': position,
        'plaza': plaza,
        'level': level,
        'user_id': userId,
      };
}
