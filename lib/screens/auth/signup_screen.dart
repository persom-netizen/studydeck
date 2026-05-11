import 'package:flutter/material.dart';

/// Sign Up screen scaffold.
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: const Center(
        child: Text('Sign Up - implementation scaffold ready'),
      ),
    );
  }
}
