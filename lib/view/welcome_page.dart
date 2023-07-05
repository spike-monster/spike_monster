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
  late Image _crowImageSprite1;
  late Image _crowImageSprite2;
  late Image _crow;
  int crowFlyingHeight = 0;
  int crowFlyingLength = 0;

  void loadCrowImage() {
    _crowImageSprite1 = Image.asset('images/crow_sprite1.png');
    _crowImageSprite2 = Image.asset('images/crow_sprite2.png');
  }

  void crowFlying() {
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (_crow == _crowImageSprite1) {
        _crow = _crowImageSprite2;
        crowFlyingLength += 10;
        crowFlyingHeight += 10;
      } else {
        _crow = _crowImageSprite1;
        crowFlyingHeight -= 10;
      }
    });
  }

  double resetCrowFlyingLength() {
    setState(() {
      crowFlyingLength = 0;
    });
    return 0;
  }

  @override
  void initState() {
    super.initState();
    loadCrowImage();
    _crow = _crowImageSprite2;
    _animationController = AnimationController(
      lowerBound: 0,
      upperBound: 400,
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    crowFlying();
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
              Container(
                height: 150.0,
                width: 200,
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(
                  right: (crowFlyingLength + 10 > screenWidth)
                      ? resetCrowFlyingLength()
                      : crowFlyingLength.toDouble(),
                  top: crowFlyingHeight.toDouble() + 20,
                ),
                child: _crow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
