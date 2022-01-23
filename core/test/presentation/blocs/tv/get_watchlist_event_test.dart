import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetWatchlistTvEvent', () {
    group('GetAllWatchlistTv', () {
      test('supports value comparisons', () {
        expect(GetAllWatchlistTv(), GetAllWatchlistTv());
        expect(GetAllWatchlistTv().props, GetAllWatchlistTv().props);
      });
    });
  });
}
