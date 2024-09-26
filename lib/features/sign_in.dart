import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Email"),
          TextFormField(),
          const Text("Password"),
          TextFormField(),
          ElevatedButton(onPressed: () {}, child: const Text("Sign In"))
        ],
      ),
    );
  }
}
