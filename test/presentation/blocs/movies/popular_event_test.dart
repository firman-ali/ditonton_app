import 'package:ditonton/presentation/blocs/movies/popular_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetPopularMoviesEvent', () {
    group('GetAllPopularMovies', () {
      test('supports value comparisons', () {
        expect(GetAllPopularMovies(), GetAllPopularMovies());
      });
    });
  });
}
