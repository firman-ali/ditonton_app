import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/blocs/movies/now_playing_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetNowPlayingMovieBloc getMovieListBloc;
  late MockGetNowPlayingMovies mockNowPlayingMovies;
  final tMovieList = <Movie>[testMovie];

  setUp(() {
    mockNowPlayingMovies = MockGetNowPlayingMovies();
    getMovieListBloc = GetNowPlayingMovieBloc(mockNowPlayingMovies);
  });

  test('initial state should be empty', () {
    expect(getMovieListBloc.state, GetNowPlayingMoviesEmpty());
  });

  blocTest<GetNowPlayingMovieBloc, NowPlayingMoviesState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockNowPlayingMovies.execute())
          .thenAnswer((_) async => const Right([]));
      return getMovieListBloc;
    },
    act: (bloc) => bloc.add(GetAllNowPlayingMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetNowPlayingMoviesLoading(),
      GetNowPlayingMoviesEmpty(),
    ],
    verify: (bloc) {
      verify(mockNowPlayingMovies.execute());
    },
  );

  blocTest<GetNowPlayingMovieBloc, NowPlayingMoviesState>(
    'Should emit [Loading, HasData] when data now playing movies is gotten successfully',
    build: () {
      when(mockNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return getMovieListBloc;
    },
    act: (bloc) => bloc.add(GetAllNowPlayingMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetNowPlayingMoviesLoading(),
      GetNowPlayingMoviesHasData(tMovieList),
    ],
    verify: (bloc) {
      verify(mockNowPlayingMovies.execute());
    },
  );

  blocTest<GetNowPlayingMovieBloc, NowPlayingMoviesState>(
    'Should emit [Loading, Error] when get data now playing movies is unsuccessful',
    build: () {
      when(mockNowPlayingMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return getMovieListBloc;
    },
    act: (bloc) => bloc.add(GetAllNowPlayingMovies()),
    expect: () => [
      GetNowPlayingMoviesLoading(),
      const GetNowPlayingMoviesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockNowPlayingMovies.execute());
    },
  );
}
