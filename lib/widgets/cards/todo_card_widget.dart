import 'package:flutter/material.dart';

/// To-do item card with completion indicator.
class TodoCardWidget extends StatelessWidget {
  const TodoCardWidget({
    super.key,
    required this.title,
    required this.completed,
    this.onChanged,
  });

  final String title;
  final bool completed;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: completed,
        onChanged: onChanged,
        title: Text(title),
      ),
    );
  }
}
