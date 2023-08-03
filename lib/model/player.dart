import 'package:flutter/material.dart';

class Player {
  final Image image;
  final String name;
  final String position;
  Ability ability;

  Player({
    required this.image,
    required this.name,
    required this.ability,
    required this.position,
  });
}

class Ability {
  final int set;
  final int speed;
  final int spike;
  final int block;
  final int jump;

  const Ability({
    required this.set,
    required this.speed,
    required this.block,
    required this.jump,
    required this.spike,
  });
}
