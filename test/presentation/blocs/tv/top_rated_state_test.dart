import 'package:ditonton/presentation/blocs/tv/top_rated_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetTopRatedTvState', () {
    test('empty state supports value comparisons', () {
      expect(GetTopRatedTvEmpty(), GetTopRatedTvEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetTopRatedTvLoading(), GetTopRatedTvLoading());
    });
    test('error state supports value comparisons', () {
      expect(const GetTopRatedTvError(''), const GetTopRatedTvError(''));
    });
    test('has data state supports value comparisons', () {
      expect(const GetTopRatedTvHasData([]), const GetTopRatedTvHasData([]));
    });
  });
}
