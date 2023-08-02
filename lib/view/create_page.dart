import 'package:flutter/material.dart';
import 'package:spike_monster/view/profile_page.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({
    super.key,
  });

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  String playerID='a';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.orangeAccent.shade200,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProfilePage()));
                },
                child: const Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 80,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Create Game',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 35,
                        fontWeight: FontWeight.w600,
                     ),
                    ),
                    const SizedBox(
                      height:30,
                    ),
                    const Text(
                      'Your ID is ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: (){},
                      child :
                        const Text(
                          'Create',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                    ),
                  ],
                )
              ),
            ],
          ),
      ),
    );
  }
}