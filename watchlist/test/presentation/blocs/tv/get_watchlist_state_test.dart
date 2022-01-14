import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watchlist/watchlist.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  List<TvSeries> tList = [testTv];
  group('GetWatchlistTvState', () {
    test('empty state supports value comparisons', () {
      expect(GetWatchlistTvEmpty(), GetWatchlistTvEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetWatchlistTvLoading(), GetWatchlistTvLoading());
    });
    test('error state supports value comparisons', () {
      expect(GetWatchlistTvError(errorMsg), GetWatchlistTvError(errorMsg));
    });
    test('has data state supports value comparisons', () {
      expect(GetWatchlistTvHasData(tList), GetWatchlistTvHasData(tList));
    });
  });
}
