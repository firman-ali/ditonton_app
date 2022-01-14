import 'package:flutter_test/flutter_test.dart';
import 'package:search/presentation/bloc/movies/search_bloc.dart';

void main() {
  const query = 'query';
  group('SearchMoviesEvent', () {
    group('OnMoviesQueryChanged', () {
      test('supports value comparisons', () {
        expect(const OnMoviesQueryChanged(query),
            const OnMoviesQueryChanged(query));
      });
    });
  });
}
