import 'package:flutter/material.dart';

/// Flashcard preview card.
class FlashcardWidget extends StatelessWidget {
  const FlashcardWidget({super.key, required this.front, required this.back});

  final String front;
  final String back;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(front), subtitle: Text(back)),
    );
  }
}
