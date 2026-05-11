import 'package:flutter/material.dart';

/// Course setup form used in create/edit flow.
class CourseFormWidget extends StatelessWidget {
  const CourseFormWidget({
    super.key,
    required this.courseNameController,
    required this.instructorController,
  });

  final TextEditingController courseNameController;
  final TextEditingController instructorController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: courseNameController,
          decoration: const InputDecoration(labelText: 'Course Name'),
        ),
        TextFormField(
          controller: instructorController,
          decoration: const InputDecoration(labelText: 'Instructor'),
        ),
      ],
    );
  }
}
