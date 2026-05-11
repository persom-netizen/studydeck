import 'package:flutter/material.dart';

/// Courses screen scaffold.
class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Courses')),
      body: const Center(
        child: Text('Courses - implementation scaffold ready'),
      ),
    );
  }
}
