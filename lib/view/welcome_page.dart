import 'package:flutter/material.dart';
import 'package:spike_monster/constant.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Image _crowImageSprite1;
  late Image _crowImageSprite2;
  late Image _crow;

  void loadCrowImage() {
    _crowImageSprite1 = Image.asset('images/crow_sprite1.png');
    _crowImageSprite2 = Image.asset('images/crow_sprite2.png');
  }

  void crowFlying() {
    if(_animationController.value %5 == 0) {
      setState(() {
        _crow = _crowImageSprite1;
      });
    } else {
      setState(() {
        _crow = _crowImageSprite2;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadCrowImage();
    _crow = _crowImageSprite1;
    _animationController = AnimationController(
      upperBound: 100,
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    // crowFlying();
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
            Expanded(child: _crow),
          ],
        ),
      ),
    );
  }
}
