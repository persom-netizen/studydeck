import 'package:flutter/material.dart';

/// Course metadata summary card.
class CourseCardWidget extends StatelessWidget {
  const CourseCardWidget({
    super.key,
    required this.name,
    required this.instructor,
  });

  final String name;
  final String instructor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(name), subtitle: Text(instructor)),
    );
  }
}
