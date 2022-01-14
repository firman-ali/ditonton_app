import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../test/dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  List<Movie> tList = [testMovie];
  group('GetPopularMoviesState', () {
    test('empty state supports value comparisons', () {
      expect(GetPopularMoviesEmpty(), GetPopularMoviesEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetPopularMoviesLoading(), GetPopularMoviesLoading());
    });
    test('error state supports value comparisons', () {
      expect(GetPopularMoviesError(errorMsg), GetPopularMoviesError(errorMsg));
    });
    test('has data state supports value comparisons', () {
      expect(GetPopularMoviesHasData(tList), GetPopularMoviesHasData(tList));
    });
  });
}
