class Account {
  String name;
  String email;
  int record;
  String? id;

  Account({
    required this.name,
    required this.email,
    this.record = 0,
    this.id,
  });
}
