import 'package:flutter/material.dart';

class GameStorePage extends StatefulWidget {
  const GameStorePage({super.key});

  @override
  State<GameStorePage> createState() => _GameStorePageState();
}

class _GameStorePageState extends State<GameStorePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.orangeAccent.shade200,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  width: 180,
                  height: 480,
                  color: const Color.fromARGB(255, 255, 225, 123),
                  child: ListView(
                    children: [
                      const Text(
                        'Character',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 197, 22, 5),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('images/character/crocodile.jpg'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('images/character/deer.jpg'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('images/character/dog.jpg'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('images/character/shark.jpg'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('images/character/tiger.jpg'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              width: 200,
            ),

            Container(
              color: const Color.fromARGB(255, 255, 225, 123),
              width: 300,
              height: 200,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Set',
                        style: TextStyle(
                          fontFamily: 'DancingScript',
                        ),
                      )
                    ],
                  ),
                  Row(),
                  Row(),
                  Row(),
                  Row(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AbilityContainer extends StatelessWidget {
  const AbilityContainer({
    super.key,
    required this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.black12,
    );
  }
}
