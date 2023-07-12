import 'package:flutter/material.dart';

class Account {
  String name;
  String email;
  String password;
  int record;
  Image? image;
  String? id;

  Account({
    required this.name,
    required this.email,
    required this.password,
    this.image,
    this.record = 0,
    this.id,
  });
}