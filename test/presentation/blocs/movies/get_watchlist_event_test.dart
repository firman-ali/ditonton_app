import 'package:ditonton/presentation/blocs/movies/get_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetWatchlistMoviesEvent', () {
    group('GetAllWatchlistMovies', () {
      test('supports value comparisons', () {
        expect(GetAllWatchlistMovies(), GetAllWatchlistMovies());
      });
    });
  });
}
