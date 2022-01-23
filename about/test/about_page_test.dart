import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _makeTestableWidget() {
    return const MaterialApp(
      home: AboutPage(),
    );
  }

  group('About Page Test:', () {
    testWidgets('page should show empty textfield',
        (WidgetTester tester) async {
      final backButton = find.byIcon(Icons.arrow_back);
      final imageLogo = find.byType(Image);
      final textDescript = find.byType(Text);

      await tester.pumpWidget(_makeTestableWidget());

      expect(backButton, findsOneWidget);
      expect(imageLogo, findsOneWidget);
      expect(textDescript, findsOneWidget);
    });

    testWidgets('page should close when back button clicked',
        (WidgetTester tester) async {
      final backButton = find.byIcon(Icons.arrow_back);
      final imageLogo = find.byType(Image);
      final textDescript = find.byType(Text);

      await tester.pumpWidget(_makeTestableWidget());
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      expect(imageLogo, findsNothing);
      expect(textDescript, findsNothing);
    });
  });
}
