import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetTopRatedTvEvent', () {
    group('GetAllTopRatedTv', () {
      test('supports value comparisons', () {
        expect(GetAllTopRatedTv(), GetAllTopRatedTv());
        expect(GetAllTopRatedTv().props, GetAllTopRatedTv().props);
      });
    });
  });
}
