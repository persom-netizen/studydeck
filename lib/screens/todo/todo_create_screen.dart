import 'package:flutter/material.dart';

/// Create To-do screen scaffold.
class TodoCreateScreen extends StatelessWidget {
  const TodoCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create To-do')),
      body: const Center(
        child: Text('Create To-do - implementation scaffold ready'),
      ),
    );
  }
}
