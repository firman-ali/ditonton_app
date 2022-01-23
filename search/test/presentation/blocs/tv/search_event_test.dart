import 'package:flutter_test/flutter_test.dart';
import 'package:search/search.dart';

void main() {
  const query = 'query';
  group('SearchTvEvent', () {
    group('OnTvQueryChanged', () {
      test('supports value comparisons', () {
        expect(const OnTvsQueryChanged(query), const OnTvsQueryChanged(query));
        expect(const OnTvsQueryChanged(query).props,
            const OnTvsQueryChanged(query).props);
      });
    });
  });
}
