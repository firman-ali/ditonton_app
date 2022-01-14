import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../test/dummy_data/dummy_objects.dart';

void main() {
  group('GetDetailTvState', () {
    test('empty state supports value comparisons', () {
      expect(GetDetailTvEmpty(), GetDetailTvEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetDetailTvLoading(), GetDetailTvLoading());
    });
    test('error state supports value comparisons', () {
      expect(const GetDetailTvError(''), const GetDetailTvError(''));
    });
    test('has data state supports value comparisons', () {
      expect(GetDetailTvHasData(testTvDetail, const []),
          GetDetailTvHasData(testTvDetail, const []));
    });
  });
}
