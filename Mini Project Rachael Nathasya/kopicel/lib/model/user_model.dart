class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String avatar;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.name,
      required this.avatar});
}
