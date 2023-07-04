import 'package:flutter/material.dart';
import 'package:spike_monster/constant.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.orangeAccent.shade700,
              Colors.orangeAccent.shade200,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 80.0),
              child: Text(
                'Spike Monster',
                style: kTitleTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
