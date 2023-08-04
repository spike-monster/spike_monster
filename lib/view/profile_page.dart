import 'package:flutter/material.dart';
import 'package:spike_monster/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spike_monster/service/auth_api_service.dart';
import 'package:spike_monster/model/account.dart';
import 'package:spike_monster/mock_data.dart';
import 'package:spike_monster/model/character_image.dart';
import 'package:spike_monster/view/game_page.dart';
import 'package:spike_monster/view/create_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthApiService _authApi = AuthApiService.instance;
  late Account _account;
  final players = PlayersImage();
  late Image image;
  String roomID = '' ;
  @override
  void initState() {
    super.initState();
    initAccount();
    loadImage();
  }

  Future<void> initAccount() async {
    // _account = await _authApi.getAccountDetail();
    _account = MockData().account;
  }

  Future<void> loadImage() async {
    // image = await players.images['setter']['及川'];
    image = Image.asset('images/及川.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.shop,
        ),
        onPressed: () {},
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
        width: double.infinity,
        color: Colors.orangeAccent.shade200,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.15),
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset: const Offset(2.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      colors: [
                        Colors.orangeAccent.shade700.withOpacity(0.6),
                        Colors.orangeAccent.shade400.withOpacity(0.7),
                        Colors.orangeAccent.shade200.withOpacity(1),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 80.0,
                            backgroundColor: Colors.white.withOpacity(0.1),
                            child: _account.image ??
                                Image.asset('images/volleyball_background.png'),
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            _account.name,
                            style: kTitleTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _account.image ??
                                  Image.asset('images/crown.png', scale: 15),
                              const SizedBox(width: 13),
                              Text(
                                'Record : ${_account.record} wins',
                                style: GoogleFonts.getFont('Pacifico',
                                    fontSize: 17.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Expanded(
                        child: Text(
                          'Resent Use : ',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CircleAvatar(
                                radius: 40.0,
                                backgroundImage: players.images['setter']['及川'],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CircleAvatar(
                                radius: 40.0,
                                backgroundImage: players.images['setter']['影山'],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CircleAvatar(
                                radius: 40.0,
                                backgroundImage: players.images['spiker']['日向'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Start A Game',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                       roomID = value;
                    },
                    // decoration: const InputDecoration(
                    //   labelText: 'Room ID',
                    //   labelStyle: TextStyle(
                    //     fontSize: 25,
                    //   ),
                    // ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const GamePage()));
                    },
                    minWidth: 220,
                    height: 40,
                    color: const Color.fromARGB(255, 255, 225, 123),
                    child: const Text(
                      'Join',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),

                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreatePage()));
                    },
                    minWidth: 220,
                    height: 40,
                    color: const Color.fromARGB(255, 255, 225, 123),
                    child: const Text(
                      'Create',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children:[
//
// const Text(
// 'Start A Game',
// textAlign: TextAlign.center,
// overflow: TextOverflow.ellipsis,
//
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 30,
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// MaterialButton(
// onPressed: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => const JoinPage()));
// },
// child: const Text(
// 'Join Game',
// style: TextStyle(
// fontSize: 30,),
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// MaterialButton(
// onPressed: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => const CreatePage()));
// },
// child: const Text(
// 'Create Game',
// style: TextStyle(
// fontSize: 30,),
// ),
// ),
// ]
// ),
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text(
// 'Start A Game',
// textAlign: TextAlign.center,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 30,
// ),
// ),
//
// TextField(
// decoration: InputDecoration(
// labelText: 'Room ID',
// border: OutlineInputBorder(),
// ),
// ),
//
// MaterialButton(
// onPressed: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => const GamePage()));
// },
// minWidth: 180,
// color: const Color.fromARGB(255, 255, 225, 123),
// child: const Text(
// 'Join',
// style: TextStyle(
// fontSize: 25,
// ),
// ),
// ),
//
// MaterialButton(
// onPressed: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => const CreatePage()));
// },
// minWidth: 180,
// color: const Color.fromARGB(255, 255, 225, 123),
// child: const Text(
// 'Create',
// style: TextStyle(
// fontSize: 25,
// ),
// ),
// ),
// ]
// ),
