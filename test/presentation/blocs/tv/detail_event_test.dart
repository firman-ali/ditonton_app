import 'package:ditonton/presentation/blocs/tv/detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetDetailTvEvent', () {
    group('GetAllDetailTv', () {
      test('supports value comparisons', () {
        expect(GetDetailTv(1), GetDetailTv(1));
      });
    });
  });
}
