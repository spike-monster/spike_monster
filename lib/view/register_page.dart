import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Account number',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Text('Create'),
                        ),
                      ])),
            ]),
      ),
    );
  }
}
