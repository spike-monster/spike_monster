import 'package:flutter/material.dart';
import 'package:spike_monster/view/profile_page.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  String playerID = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfilePage()));
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Join Game',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80.0, vertical: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Join Game',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextField(
                            onChanged: (value) {
                              playerID = value;
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: 'Enter Player ID',
                                labelStyle: TextStyle(
                                  fontSize: 25,
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: const Text(
                              'Join',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      onChanged: (value) {
                        playerID = value;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Enter Player ID',
                        labelStyle: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        'Join',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
