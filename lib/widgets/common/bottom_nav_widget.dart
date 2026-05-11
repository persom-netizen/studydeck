import 'package:flutter/material.dart';

/// Basic bottom navigation shell for future feature expansion.
class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Decks'),
        BottomNavigationBarItem(icon: Icon(Icons.task), label: 'To-do'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Calendar'),
      ],
    );
  }
}
