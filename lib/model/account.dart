class Account {
  String name;
  String email;
  int record;
  int id;

  Account({
    required this.name,
    required this.email,
    this.record = 0,
    required this.id,
  });
}
