import 'package:ditonton/presentation/blocs/movies/watchlist_status_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WatchlistStatusMovieState', () {
    group('WatchlistStatusMovie', () {
      test('init state supports value comparisons', () {
        expect(InitWatchlistStatusMovie(), InitWatchlistStatusMovie());
      });
      test('error state supports value comparisons', () {
        expect(const WatchlistStatusMovieError(''),
            const WatchlistStatusMovieError(''));
      });
      test('has data state supports value comparisons', () {
        expect(const WatchlistStatusMovieHasData(true),
            const WatchlistStatusMovieHasData(true));
      });
    });
    group('AddWatchlistMovie', () {
      test('success state supports value comparisons', () {
        expect(const AddWatchlistMovieSuccess(true, ''),
            const AddWatchlistMovieSuccess(true, ''));
      });
    });
    group('RemoveWatchlistMovie', () {
      test('success state supports value comparisons', () {
        expect(const RemoveWatchlistMovieSuccess(false, ''),
            const RemoveWatchlistMovieSuccess(false, ''));
      });
    });
  });
}
