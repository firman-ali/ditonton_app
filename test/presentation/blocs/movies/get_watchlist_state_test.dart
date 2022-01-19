import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/blocs/movies/get_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  List<Movie> tList = [testMovie];
  group('GetWatchlistMoviesState', () {
    test('empty state supports value comparisons', () {
      expect(GetWatchlistMoviesEmpty(), GetWatchlistMoviesEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetWatchlistMoviesLoading(), GetWatchlistMoviesLoading());
    });
    test('error state supports value comparisons', () {
      expect(
          GetWatchlistMoviesError(errorMsg), GetWatchlistMoviesError(errorMsg));
    });
    test('has data state supports value comparisons', () {
      expect(
          GetWatchlistMoviesHasData(tList), GetWatchlistMoviesHasData(tList));
    });
  });
}
