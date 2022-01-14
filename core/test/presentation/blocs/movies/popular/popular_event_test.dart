import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetPopularMoviesEvent', () {
    group('GetAllPopularMovies', () {
      test('supports value comparisons', () {
        expect(GetAllPopularMovies(), GetAllPopularMovies());
      });
    });
  });
}
