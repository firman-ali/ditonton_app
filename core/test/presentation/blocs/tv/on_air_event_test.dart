import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetOnAirTvEvent', () {
    group('GetAllOnAirTv', () {
      test('supports value comparisons', () {
        expect(GetAllOnAirTv(), GetAllOnAirTv());
        expect(GetAllOnAirTv().props, GetAllOnAirTv().props);
      });
    });
  });
}
