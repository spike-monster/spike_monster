import 'package:flutter/material.dart';
import 'package:spike_monster/view/welcome_page.dart';

void main() => runApp(const SpikeMonster());

class SpikeMonster extends StatelessWidget {
  const SpikeMonster({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomePage(),
    );
  }
}
