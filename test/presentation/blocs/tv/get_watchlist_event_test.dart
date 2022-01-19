import 'package:ditonton/presentation/blocs/tv/get_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetWatchlistTvEvent', () {
    group('GetAllWatchlistTv', () {
      test('supports value comparisons', () {
        expect(GetAllWatchlistTv(), GetAllWatchlistTv());
      });
    });
  });
}
