import 'package:flutter/material.dart';

/// To-do List screen scaffold.
class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-do List')),
      body: const Center(
        child: Text('To-do List - implementation scaffold ready'),
      ),
    );
  }
}
