import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';

void main() {
  group('WatchlistStatusMovieEvent', () {
    group('GetWatchlistStatusMovie', () {
      test('supports value comparisons', () {
        expect(GetWatchlistStatusMovie(1), GetWatchlistStatusMovie(1));
        expect(
            GetWatchlistStatusMovie(1).props, GetWatchlistStatusMovie(1).props);
      });
    });
    group('AddMovieToWatchlist', () {
      test('supports value comparisons', () {
        expect(AddMovieToWatchlist(testMovieDetail),
            AddMovieToWatchlist(testMovieDetail));
        expect(AddMovieToWatchlist(testMovieDetail).props,
            AddMovieToWatchlist(testMovieDetail).props);
      });
    });
    group('RemoveMovieFromWatchlist', () {
      test('supports value comparisons', () {
        expect(RemoveMovieFromWatchlist(testMovieDetail),
            RemoveMovieFromWatchlist(testMovieDetail));
        expect(RemoveMovieFromWatchlist(testMovieDetail).props,
            RemoveMovieFromWatchlist(testMovieDetail).props);
      });
    });
  });
}
