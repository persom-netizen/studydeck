import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/app_constants.dart';
import 'config/firebase_config.dart';
import 'config/routes.dart';
import 'providers/auth_provider.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: StudyDeckApp()));
}

/// Root Study Deck application widget.
class StudyDeckApp extends ConsumerWidget {
  const StudyDeckApp({super.key, this.initializationFuture});

  final Future<Object?>? initializationFuture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: initializationFuture ?? FirebaseConfig.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }
        if (snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Firebase initialization failed. '
                    'See docs/FIREBASE_SETUP.md for configuration steps.',
                  ),
                ),
              ),
            ),
          );
        }

        final authState = ref.watch(authStateProvider);
        return MaterialApp(
          title: AppConstants.appName,
          theme: AppTheme.lightTheme(),
          initialRoute: authState.maybeWhen(
            data: (user) =>
                user == null ? AppRoutes.login : AppRoutes.dashboard,
            orElse: () => AppRoutes.login,
          ),
          routes: AppRoutes.routeTable,
        );
      },
    );
  }
}
