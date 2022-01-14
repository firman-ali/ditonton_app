import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search/search.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  List<TvSeries> tList = [testTv];
  group('SearchTvsState', () {
    test('waiting state supports value comparisons', () {
      expect(WaitingSearchMovie(), WaitingSearchMovie());
    });
    test('empty state supports value comparisons', () {
      expect(SearchTvsEmpty(), SearchTvsEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(SearchTvsLoading(), SearchTvsLoading());
    });
    test('error state supports value comparisons', () {
      expect(SearchTvsError(errorMsg), SearchTvsError(errorMsg));
    });
    test('has data state supports value comparisons', () {
      expect(SearchTvsHasData(tList), SearchTvsHasData(tList));
    });
  });
}
