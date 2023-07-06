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
  final bool _isSpike = false;
  bool _isAnimationFinished = false;

  void loadImages() {
    _volleyBall = Image.asset('images/volleyball.png');
  }

  @override
  void initState() {
    super.initState();
    loadImages();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    // late final Animation<double> animation = CurvedAnimation(
    //   parent: _animationController,
    //   curve: Curves.elasticOut,
    // );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
              padding: const EdgeInsets.only(left: 25.0, top: 80.0),
              child: Row(
                children: [
                  Text(
                    'Spike Monster ',
                    style: kTitleTextStyle,
                  ),
                  Visibility(
                    visible: _isAnimationFinished,
                    child: Hero(
                      tag: 'volleyball',
                      child: SizedBox(
                        width: 100,
                        child: _volleyBall,
                      ),
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
                setState(() {
                  _isAnimationFinished = true;
                });
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
                      : Hero(
                          tag: 'volleyball',
                          child: RotationTransition(
                            turns: _animationController,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 250),
                              child: _volleyBall,
                            ),
                          ),
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
