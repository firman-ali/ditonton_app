import 'package:ditonton/presentation/blocs/movies/now_playing_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetNowPlayingMoviesEvent', () {
    group('GetAllNowPlayingMovies', () {
      test('supports value comparisons', () {
        expect(GetAllNowPlayingMovies(), GetAllNowPlayingMovies());
      });
    });
  });
}
