import 'package:flutter_test/flutter_test.dart';

import 'package:studydeck/main.dart';

void main() {
  testWidgets('App shows only Hello on home page', (WidgetTester tester) async {
    await tester.pumpWidget(const StudyDeckApp());

    expect(find.text('Hello'), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });
}
