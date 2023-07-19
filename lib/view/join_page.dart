import 'package:flutter/material.dart';


class JoinPage extends StatefulWidget{
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
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
        color: Colors.orangeAccent.shade200,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Join Game',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                onChanged: (value) {
                  playerID=value;
                },
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Enter Player ID',
                    labelStyle: TextStyle(
                      fontSize: 30,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              MaterialButton(
                onPressed: () {

                },
                child: const Text(
                  'Join',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),


            ]
          ),
        ),

      ),
    );
  }
}