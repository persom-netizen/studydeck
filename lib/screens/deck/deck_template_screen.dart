import 'package:flutter/material.dart';

/// Deck Templates screen scaffold.
class DeckTemplateScreen extends StatelessWidget {
  const DeckTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deck Templates')),
      body: const Center(
        child: Text('Deck Templates - implementation scaffold ready'),
      ),
    );
  }
}
