import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetAiringTodayTvEvent', () {
    group('GetAllAiringTodayTv', () {
      test('supports value comparisons', () {
        expect(GetAllAiringTodayTv(), GetAllAiringTodayTv());
        expect(GetAllAiringTodayTv().props, GetAllAiringTodayTv().props);
      });
    });
  });
}
