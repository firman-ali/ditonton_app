import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/blocs/movies/popular_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy_data/dummy_objects.dart';

void main() {
  String errorMsg = 'error';
  List<Movie> tList = [testMovie];
  group('GetPopularMoviesState', () {
    test('empty state supports value comparisons', () {
      expect(GetPopularMoviesEmpty(), GetPopularMoviesEmpty());
    });
    test('loading state supports value comparisons', () {
      expect(GetPopularMoviesLoading(), GetPopularMoviesLoading());
    });
    test('error state supports value comparisons', () {
      expect(GetPopularMoviesError(errorMsg), GetPopularMoviesError(errorMsg));
    });
    test('has data state supports value comparisons', () {
      expect(GetPopularMoviesHasData(tList), GetPopularMoviesHasData(tList));
    });
  });
}
