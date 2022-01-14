import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetDetailMovieEvent', () {
    group('GetAllDetailMovie', () {
      test('supports value comparisons', () {
        expect(GetDetailMovie(1), GetDetailMovie(1));
      });
    });
  });
}
