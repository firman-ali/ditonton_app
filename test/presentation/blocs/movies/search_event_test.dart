import 'package:ditonton/presentation/blocs/movies/search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

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
