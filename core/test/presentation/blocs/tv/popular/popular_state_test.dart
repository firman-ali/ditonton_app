import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetPopularTvState', () {
    test('empty state supports value comparisons', () {
      expect(GetPopularTvEmpty(), GetPopularTvEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetPopularTvLoading(), GetPopularTvLoading());
    });
    test('error state supports value comparisons', () {
      expect(const GetPopularTvError(''), const GetPopularTvError(''));
    });
    test('has data state supports value comparisons', () {
      expect(const GetPopularTvHasData([]), const GetPopularTvHasData([]));
    });
  });
}
