import 'package:flutter/material.dart';

/// Create Deck screen scaffold.
class DeckCreateScreen extends StatelessWidget {
  const DeckCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Deck')),
      body: const Center(
        child: Text('Create Deck - implementation scaffold ready'),
      ),
    );
  }
}
