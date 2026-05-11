import 'package:flutter/material.dart';

/// Flashcards screen scaffold.
class FlashcardListScreen extends StatelessWidget {
  const FlashcardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flashcards')),
      body: const Center(
        child: Text('Flashcards - implementation scaffold ready'),
      ),
    );
  }
}
