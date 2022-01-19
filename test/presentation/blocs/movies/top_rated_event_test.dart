import 'package:ditonton/presentation/blocs/movies/top_rated_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetTopRatedMoviesEvent', () {
    group('GetAllTopRatedMovies', () {
      test('supports value comparisons', () {
        expect(GetAllTopRatedMovies(), GetAllTopRatedMovies());
      });
    });
  });
}
