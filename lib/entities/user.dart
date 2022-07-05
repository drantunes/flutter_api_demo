class User {
  String? id;
  String name;
  String email;
  String? avatar;

  User({
    this.id,
    required this.name,
    required this.email,
    this.avatar,
  });
}
