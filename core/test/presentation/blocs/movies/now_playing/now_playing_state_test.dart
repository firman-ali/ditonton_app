import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../test/dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  List<Movie> tList = [testMovie];
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
      expect(
          GetNowPlayingMoviesHasData(tList), GetNowPlayingMoviesHasData(tList));
    });
  });
}
