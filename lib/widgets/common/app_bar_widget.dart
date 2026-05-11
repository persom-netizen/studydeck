import 'package:flutter/material.dart';

/// Shared app bar used by Study Deck screens.
class StudyDeckAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StudyDeckAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
