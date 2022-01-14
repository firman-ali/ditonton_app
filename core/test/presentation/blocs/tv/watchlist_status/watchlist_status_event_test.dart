import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../test/dummy_data/dummy_objects.dart';

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
