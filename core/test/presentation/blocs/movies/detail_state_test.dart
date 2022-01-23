import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  group('GetDetailMovieState', () {
    test('empty state supports value comparisons', () {
      expect(GetDetailMovieEmpty(), GetDetailMovieEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetDetailMovieLoading(), GetDetailMovieLoading());
    });
    test('error state supports value comparisons', () {
      expect(GetDetailMovieError(errorMsg), GetDetailMovieError(errorMsg));
    });
    test('has data state supports value comparisons', () {
      expect(GetDetailMovieHasData(testMovieDetail, testMovieList),
          GetDetailMovieHasData(testMovieDetail, testMovieList));
    });
  });
}
