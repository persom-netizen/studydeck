import 'package:flutter_test/flutter_test.dart';

import 'package:studydeck/main.dart';

void main() {
  testWidgets('App shows Hello on home page', (WidgetTester tester) async {
    await tester.pumpWidget(const StudyDeckApp());

    expect(find.text('Hello'), findsOneWidget);
  });
}
