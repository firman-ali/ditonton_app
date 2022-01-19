import 'package:ditonton/presentation/blocs/movies/now_playing_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  group('GetNowPlayingMoviesState', () {
    test('empty state supports value comparisons', () {
      expect(GetNowPlayingMoviesEmpty(), GetNowPlayingMoviesEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetNowPlayingMoviesLoading(), GetNowPlayingMoviesLoading());
    });
    test('error state supports value comparisons', () {
      expect(GetNowPlayingMoviesError(errorMsg),
          GetNowPlayingMoviesError(errorMsg));
    });
    test('has data state supports value comparisons', () {
      expect(GetNowPlayingMoviesHasData(testMovieList),
          GetNowPlayingMoviesHasData(testMovieList));
    });
  });
}
