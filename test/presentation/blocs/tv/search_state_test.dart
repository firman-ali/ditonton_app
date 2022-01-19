import 'package:ditonton/presentation/blocs/tv/search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  group('SearchTvsState', () {
    test('waiting state supports value comparisons', () {
      expect(WaitingSearchTv(), WaitingSearchTv());
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
      expect(SearchTvsHasData(testTvList), SearchTvsHasData(testTvList));
    });
  });
}
