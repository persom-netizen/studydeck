import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/app_constants.dart';
import 'config/firebase_config.dart';
import 'config/routes.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: StudyDeckApp()));
}

/// Root Study Deck application widget.
class StudyDeckApp extends StatelessWidget {
  const StudyDeckApp({super.key, this.initializationFuture});

  final Future<Object?>? initializationFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializationFuture ?? FirebaseConfig.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        return MaterialApp(
          title: AppConstants.appName,
          theme: AppTheme.lightTheme(),
          initialRoute: AppRoutes.dashboard,
          routes: AppRoutes.routeTable,
        );
      },
    );
  }
}
