import 'package:flutter/material.dart';
import '../constants.dart';

class GameButton extends StatelessWidget {
  GameButton({
    super.key,
    required this.name,
    required this.image,
    required this.onPressed,
    this.size,
  }) {
    biggerRadius = size != null ? size! + 3 : null;
  }

  final double? size;
  final Button name;
  final AssetImage image;
  final VoidCallback onPressed;
  double? biggerRadius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5,
      onPressed: onPressed,
      child: CircleAvatar(
        backgroundColor: Colors.brown.shade300,
        radius: biggerRadius ?? 73,
        child: CircleAvatar(
          radius: size ?? 70,
          backgroundImage: image,
        ),
      ),
    );
  }
}
