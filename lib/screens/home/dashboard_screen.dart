import 'package:flutter/material.dart';

import '../../widgets/common/bottom_nav_widget.dart';

/// Main dashboard shown after authentication.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Study Deck Dashboard')),
      body: Center(
        child: Text(switch (_index) {
          0 => 'Welcome to Study Deck',
          1 => 'Your decks and courses',
          2 => 'Your tasks',
          _ => 'Your schedule',
        }),
      ),
      bottomNavigationBar: BottomNavWidget(
        currentIndex: _index,
        onTap: (value) => setState(() => _index = value),
      ),
    );
  }
}
