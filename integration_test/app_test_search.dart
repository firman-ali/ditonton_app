import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ditonton/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('app test search will open homepage, ', () {
    testWidgets('tap on search icon will open search page',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder tabBar = find.byKey(Key('search_button'));

      await tester.tap(tabBar);
      await tester.pumpAndSettle();

      expect(find.byKey(Key('search_title')), findsOneWidget);
    });
  });
}
