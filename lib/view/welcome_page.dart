import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spike_monster/constant.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Image _volleyBall;
  late Image _volleyBallBackGround;
  bool _isSpike = false;
  bool _isAnimationFinished = false;

  void loadImages() {
    _volleyBall = Image.asset('images/volleyball.png');
    _volleyBallBackGround = Image.asset('images/volleyball_background.png');
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animationController.addListener(() {
      setState(() {});
    });
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
              padding: const EdgeInsets.only(left: 25.0, top: 80.0),
              child: Row(
                children: [
                  Text(
                    'Spike Monster ',
                    style: kTitleTextStyle,
                  ),
                  Visibility(
                    visible: _isAnimationFinished,
                    child: Expanded(
                      child: _volleyBall,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 5.0),
              child: Text(
                'Welcome Come Back',
                style: kSubtitleTextStyle,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_isSpike == false) {
                  _animationController.forward();
                  _isSpike = true;
                  Timer(const Duration(seconds: 2), () {
                    _isAnimationFinished = true;
                  });
                }
              },
              child: Visibility(
                visible: !_isAnimationFinished,
                child: Center(
                  child: _isSpike
                      ? Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Lottie.network(
                              'https://assets4.lottiefiles.com/packages/lf20_7Vud3U2XoV.json',
                              controller: _animationController),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 250),
                          child: _volleyBall,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
