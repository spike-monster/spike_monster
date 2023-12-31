import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:spike_monster/constant.dart';
import 'package:spike_monster/components/volleyball_animation_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:spike_monster/view/profile_page.dart';
import 'package:spike_monster/view/register_page.dart';
import 'package:spike_monster/service/auth_service.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late TileModel tile;
  bool _isAnimationFinished = false;
  List<dynamic> rowTiles = [];
  List<dynamic> colTiles = [];
  final _auth = AuthApi();
  String email = '';
  String password = '';

  void loadImages() {
    tile = TileModel(
        image: Image.asset('images/volleyball.png'), title: 'volleyball');
  }

  @override
  void initState() {
    super.initState();
    loadImages();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    colTiles.add(tile);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocalHeroScope(
      duration: const Duration(milliseconds: 500),
      createRectTween: (begin, end) {
        return RectTween(begin: begin, end: end);
      },
      curve: Curves.easeInOut,
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
                padding: const EdgeInsets.only(left: 25.0, top: 80.0),
                child: Row(
                  children: [
                    DefaultTextStyle(
                      style: kTitleTextStyle,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Spike Monster',
                            speed: const Duration(milliseconds: 400),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    ...rowTiles.map(
                      (tile) => Tile(
                        key: ValueKey(tile),
                        model: tile,
                        size: 80,
                        onTap: () {},
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
              const SizedBox(
                height: 50.0,
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
                    child: RotationTransition(
                      turns: _animationController,
                      child: Column(
                        children: [
                          ...colTiles.map(
                            (tile) => Tile(
                              key: ValueKey(tile),
                              model: tile,
                              size: 200,
                              onTap: () {
                                setState(() {
                                  rowTiles.add(tile);
                                  colTiles.remove(tile);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 18,
                          )),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        _auth.loginWithEmail(email: email, password: password);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      'or sign in with google?',
                      textAlign: TextAlign.center,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
