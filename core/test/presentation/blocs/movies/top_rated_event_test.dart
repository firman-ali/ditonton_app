import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetTopRatedMoviesEvent', () {
    group('GetAllTopRatedMovies', () {
      test('supports value comparisons', () {
        expect(GetAllTopRatedMovies(), GetAllTopRatedMovies());
        expect(GetAllTopRatedMovies().props, GetAllTopRatedMovies().props);
      });
    });
  });
}
