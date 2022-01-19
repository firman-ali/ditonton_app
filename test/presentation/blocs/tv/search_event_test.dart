import 'package:ditonton/presentation/blocs/tv/search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const query = 'query';
  group('SearchTvEvent', () {
    group('OnTvQueryChanged', () {
      test('supports value comparisons', () {
        expect(const OnTvsQueryChanged(query), const OnTvsQueryChanged(query));
      });
    });
  });
}
