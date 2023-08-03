import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GameButton(name: Button.spike, image: Image.asset('name'), onPressed: onPressed),
        ),
      ),
    );
  }
}



class GameButton extends StatelessWidget {
  const GameButton({
    super.key,
    required this.name,
    required this.image,
    required this.onPressed,
  });

  final Button name;
  final Image image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: image,
    );
  }
}
