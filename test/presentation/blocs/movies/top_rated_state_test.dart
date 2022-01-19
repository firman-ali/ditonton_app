import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/blocs/movies/top_rated_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  List<Movie> tList = [testMovie];
  group('GetTopRatedMoviesState', () {
    test('empty state supports value comparisons', () {
      expect(GetTopRatedMoviesEmpty(), GetTopRatedMoviesEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetTopRatedMoviesLoading(), GetTopRatedMoviesLoading());
    });
    test('error state supports value comparisons', () {
      expect(
          GetTopRatedMoviesError(errorMsg), GetTopRatedMoviesError(errorMsg));
    });
    test('has data state supports value comparisons', () {
      expect(GetTopRatedMoviesHasData(tList), GetTopRatedMoviesHasData(tList));
    });
  });
}
