import 'package:ditonton/presentation/blocs/movies/watchlist_status_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects.dart';

void main() {
  group('WatchlistStatusMovieEvent', () {
    group('GetWatchlistStatusMovie', () {
      test('supports value comparisons', () {
        expect(GetWatchlistStatusMovie(1), GetWatchlistStatusMovie(1));
      });
    });
    group('AddMovieToWatchlist', () {
      test('supports value comparisons', () {
        expect(AddMovieToWatchlist(testMovieDetail),
            AddMovieToWatchlist(testMovieDetail));
      });
    });
    group('RemoveMovieFromWatchlist', () {
      test('supports value comparisons', () {
        expect(AddMovieToWatchlist(testMovieDetail),
            AddMovieToWatchlist(testMovieDetail));
      });
    });
  });
}
