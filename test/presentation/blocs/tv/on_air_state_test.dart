import 'package:ditonton/presentation/blocs/tv/on_air_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetOnAirTvState', () {
    test('empty state supports value comparisons', () {
      expect(GetOnAirTvEmpty(), GetOnAirTvEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetOnAirTvLoading(), GetOnAirTvLoading());
    });
    test('error state supports value comparisons', () {
      expect(const GetOnAirTvError(''), const GetOnAirTvError(''));
    });
    test('has data state supports value comparisons', () {
      expect(const GetOnAirTvHasData([]), const GetOnAirTvHasData([]));
    });
  });
}
