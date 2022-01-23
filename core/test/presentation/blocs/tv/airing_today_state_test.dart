import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';

void main() {
  group('GetAiringTodayTvState', () {
    test('empty state supports value comparisons', () {
      expect(GetAiringTodayTvEmpty(), GetAiringTodayTvEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetAiringTodayTvLoading(), GetAiringTodayTvLoading());
    });
    test('error state supports value comparisons', () {
      expect(const GetAiringTodayTvError(''), const GetAiringTodayTvError(''));
    });
    test('has data state supports value comparisons', () {
      expect(GetAiringTodayTvHasData(testTvList),
          GetAiringTodayTvHasData(testTvList));
    });
  });
}
