import 'package:flutter/material.dart';

/// Reusable error widget for async screens.
class StudyDeckErrorWidget extends StatelessWidget {
  const StudyDeckErrorWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message, textAlign: TextAlign.center),
      ),
    );
  }
}
