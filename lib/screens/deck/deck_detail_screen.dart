import 'package:flutter/material.dart';

/// Deck Details screen scaffold.
class DeckDetailScreen extends StatelessWidget {
  const DeckDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deck Details')),
      body: const Center(
        child: Text('Deck Details - implementation scaffold ready'),
      ),
    );
  }
}
