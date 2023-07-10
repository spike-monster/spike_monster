import 'package:flutter/material.dart';
import 'package:spike_monster/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spike_monster/service/auth_service.dart';
import 'package:spike_monster/model/account.dart';
import 'package:spike_monster/mock_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthApi _authApi;
  late Account _account;

  @override
  void initState() {
    super.initState();
    initAccount();
  }

  Future<void> initAccount() async {
    // _authApi = AuthApi();
    // _account = await _authApi.getAccountDetail();
    _account = MockData().account;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.shop,
        ),
        onPressed: (){
          //TODO: Navigate to Game store.
        },
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
