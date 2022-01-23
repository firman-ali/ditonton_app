import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetPopularTvEvent', () {
    group('GetAllPopularTv', () {
      test('supports value comparisons', () {
        expect(GetAllPopularTv(), GetAllPopularTv());
        expect(GetAllPopularTv().props, GetAllPopularTv().props);
      });
    });
  });
}
