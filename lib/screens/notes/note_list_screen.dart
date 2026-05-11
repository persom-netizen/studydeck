import 'package:flutter/material.dart';

/// Notes screen scaffold.
class NoteListScreen extends StatelessWidget {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: const Center(
        child: Text('Notes - implementation scaffold ready'),
      ),
    );
  }
}
