import 'package:ditonton/presentation/blocs/tv/popular_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetPopularTvEvent', () {
    group('GetAllPopularTv', () {
      test('supports value comparisons', () {
        expect(GetAllPopularTv(), GetAllPopularTv());
      });
    });
  });
}
