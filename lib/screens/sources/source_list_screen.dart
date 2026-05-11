import 'package:flutter/material.dart';

/// Sources screen scaffold.
class SourceListScreen extends StatelessWidget {
  const SourceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sources')),
      body: const Center(
        child: Text('Sources - implementation scaffold ready'),
      ),
    );
  }
}
