import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetWatchlistMoviesEvent', () {
    group('GetAllWatchlistMovies', () {
      test('supports value comparisons', () {
        expect(GetAllWatchlistMovies(), GetAllWatchlistMovies());
        expect(GetAllWatchlistMovies().props, GetAllWatchlistMovies().props);
      });
    });
  });
}
