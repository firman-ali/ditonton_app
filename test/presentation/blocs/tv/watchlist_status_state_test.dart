import 'package:ditonton/presentation/blocs/tv/watchlist_status_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WatchlistStatusTvState', () {
    group('WatchlistStatusTv', () {
      test('init state supports value comparisons', () {
        expect(InitWatchlistStatusTv(), InitWatchlistStatusTv());
      });
      test('error state supports value comparisons', () {
        expect(
            const WatchlistStatusTvError(''), const WatchlistStatusTvError(''));
      });
      test('has data state supports value comparisons', () {
        expect(const WatchlistStatusTvHasData(true),
            const WatchlistStatusTvHasData(true));
      });
    });
    group('AddWatchlistTv', () {
      test('success state supports value comparisons', () {
        expect(const AddWatchlistTvSuccess(true, ''),
            const AddWatchlistTvSuccess(true, ''));
      });
    });
    group('RemoveWatchlistTv', () {
      test('success state supports value comparisons', () {
        expect(const RemoveWatchlistTvSuccess(false, ''),
            const RemoveWatchlistTvSuccess(false, ''));
      });
    });
  });
}
