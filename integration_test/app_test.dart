import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ditonton/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('app test will open home page, ', () {
    testWidgets('tap on the tv tab bar will open tv home view',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(Key('movies_bar_view')), findsOneWidget);

      final Finder tabBar = find.byKey(Key('tv_bar'));

      await tester.tap(tabBar);
      await tester.pumpAndSettle();

      expect(find.byKey(Key('tv_bar_view')), findsOneWidget);
    });
  });
}
