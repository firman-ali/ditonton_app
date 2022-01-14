import 'package:flutter_test/flutter_test.dart';
import 'package:watchlist/watchlist.dart';

void main() {
  group('GetWatchlistMoviesEvent', () {
    group('GetAllWatchlistMovies', () {
      test('supports value comparisons', () {
        expect(GetAllWatchlistMovies(), GetAllWatchlistMovies());
      });
    });
  });
}
