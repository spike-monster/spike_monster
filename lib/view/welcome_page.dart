import 'package:flutter/material.dart';
import 'package:spike_monster/constant.dart';
import 'dart:async';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                padding: const EdgeInsets.only(left: 25.0, top: 50.0),
                child: Text(
                  'Spike Monster ',
                  style: kTitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 5.0),
                child: Text(
                  'welcome come back',
                  style: kSubtitleTextStyle,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
