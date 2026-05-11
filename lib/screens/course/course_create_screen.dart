import 'package:flutter/material.dart';

/// Create Course screen scaffold.
class CourseCreateScreen extends StatelessWidget {
  const CourseCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Course')),
      body: const Center(
        child: Text('Create Course - implementation scaffold ready'),
      ),
    );
  }
}
