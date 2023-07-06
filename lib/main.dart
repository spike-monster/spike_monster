import 'package:flutter/material.dart';
import 'package:spike_monster/view/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SpikeMonster());
}

class SpikeMonster extends StatelessWidget {
  const SpikeMonster({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomePage(),
    );
  }
}
