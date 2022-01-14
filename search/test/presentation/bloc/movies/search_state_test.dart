import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search/search.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  List<Movie> tList = [testMovie];
  group('SearchMoviesState', () {
    test('waiting state supports value comparisons', () {
      expect(WaitingSearchMovie(), WaitingSearchMovie());
    });
    test('empty state supports value comparisons', () {
      expect(SearchMoviesEmpty(), SearchMoviesEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(SearchMoviesLoading(), SearchMoviesLoading());
    });
    test('error state supports value comparisons', () {
      expect(SearchMoviesError(errorMsg), SearchMoviesError(errorMsg));
    });
    test('has data state supports value comparisons', () {
      expect(SearchMoviesHasData(tList), SearchMoviesHasData(tList));
    });
  });
}
