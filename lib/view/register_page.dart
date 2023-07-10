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
                    onChanged: (value) {
                      String inputName = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      String inputRegisterEmail = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      String inputRegisterPassword = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Create',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
