import 'package:flutter/material.dart';

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
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.orangeAccent.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create Game',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 30,
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
                      fontSize: 30
                    ),
                  ),
              ),
            ],
          )
        ),
      ),
    );
  }
}