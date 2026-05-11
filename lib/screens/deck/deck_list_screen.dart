import 'package:flutter/material.dart';

/// Study Decks screen scaffold.
class DeckListScreen extends StatelessWidget {
  const DeckListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Study Decks')),
      body: const Center(
        child: Text('Study Decks - implementation scaffold ready'),
      ),
    );
  }
}
