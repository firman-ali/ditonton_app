import 'package:ditonton/presentation/blocs/tv/watchlist_status_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects.dart';

void main() {
  group('WatchlistStatusTvEvent', () {
    group('GetWatchlistStatusTv', () {
      test('supports value comparisons', () {
        expect(GetWatchlistStatusTv(1), GetWatchlistStatusTv(1));
      });
    });
    group('AddTvToWatchlist', () {
      test('supports value comparisons', () {
        expect(AddTvToWatchlist(testTvDetail), AddTvToWatchlist(testTvDetail));
      });
    });
    group('RemoveTvFromWatchlist', () {
      test('supports value comparisons', () {
        expect(AddTvToWatchlist(testTvDetail), AddTvToWatchlist(testTvDetail));
      });
    });
  });
}
