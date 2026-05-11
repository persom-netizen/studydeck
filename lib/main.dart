import 'package:flutter/material.dart';

void main() {
  runApp(const StudyDeckApp());
}

class StudyDeckApp extends StatelessWidget {
  const StudyDeckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello'))),
    );
  }
}
