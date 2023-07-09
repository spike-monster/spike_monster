class Account {
  String name;
  String email;
  String password;
  int record;
  String? id;

  Account({
    required this.name,
    required this.email,
    required this.password,
    this.record = 0,
    this.id,
  });
}