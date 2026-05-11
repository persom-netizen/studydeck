// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:studydeck/main.dart';
import 'package:studydeck/providers/auth_provider.dart';
import 'package:studydeck/providers/connectivity_provider.dart';

void main() {
  testWidgets('Study Deck routes unauthenticated users to login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authStateProvider.overrideWith((ref) => Stream.value(null)),
          // Stub connectivity so no platform plugin is invoked in tests.
          connectivityProvider.overrideWith((ref) => Stream.value(true)),
        ],
        child: StudyDeckApp(initializationFuture: Future.value()),
      ),
    );
    await tester.pump();

    // The login screen shows 'Study Deck' branding and a 'Sign In' button.
    expect(find.text('Study Deck'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
}
