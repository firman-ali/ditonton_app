import 'package:flutter_test/flutter_test.dart';
import 'package:search/search.dart';

void main() {
  const query = 'query';
  group('SearchMoviesEvent', () {
    group('OnMoviesQueryChanged', () {
      test('supports value comparisons', () {
        expect(const OnMoviesQueryChanged(query),
            const OnMoviesQueryChanged(query));
        expect(const OnMoviesQueryChanged(query).props,
            const OnMoviesQueryChanged(query).props);
      });
    });
  });
}
