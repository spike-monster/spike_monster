import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:local_hero/local_hero.dart';

class TileModel extends Equatable {
  const TileModel({required this.image, required this.title});

  final String title;
  final Image image;

  @override
  List<Object?> get props => [image, title];

  @override
  String toString() {
    return title;
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.model,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  final TileModel model;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return LocalHero(
      tag: model.title,
      child: GestureDetector(
        onTap: onTap,
        child: RawTile(
          model: model,
          size: size,
        ),
      ),
    );
  }
}

class RawTile extends StatelessWidget {
  const RawTile({
    Key? key,
    required this.model,
    required this.size,
  }) : super(key: key);

  final TileModel? model;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0),
        child: model!.image,
      ),
    );
  }
}
