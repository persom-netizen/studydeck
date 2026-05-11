// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:studydeck/main.dart';

void main() {
  testWidgets('Study Deck dashboard renders', (WidgetTester tester) async {
    await tester.pumpWidget(StudyDeckApp(initializationFuture: Future.value()));
    await tester.pump();

    expect(find.text('Study Deck Dashboard'), findsOneWidget);
    expect(find.text('Welcome to Study Deck'), findsOneWidget);
  });
}
