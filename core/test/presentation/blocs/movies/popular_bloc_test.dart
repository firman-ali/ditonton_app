import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';
import '../../../../../test/helpers/test_helper.mocks.dart';

void main() {
  late GetPopularMovieBloc getPopularMovieBloc;
  late MockGetPopularMovies mockGetPopularMovies;
  final tMovieList = <Movie>[testMovie];

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    getPopularMovieBloc = GetPopularMovieBloc(mockGetPopularMovies);
  });

  test('initial state should be empty', () {
    expect(getPopularMovieBloc.state, GetPopularMoviesEmpty());
  });

  blocTest<GetPopularMovieBloc, PopularMoviesState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => const Right([]));
      return getPopularMovieBloc;
    },
    act: (bloc) => bloc.add(GetAllPopularMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetPopularMoviesLoading(),
      GetPopularMoviesEmpty(),
    ],
    verify: (bloc) {
      verify(mockGetPopularMovies.execute());
    },
  );

  blocTest<GetPopularMovieBloc, PopularMoviesState>(
    'Should emit [Loading, HasData] when data popular movies is gotten successfully',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return getPopularMovieBloc;
    },
    act: (bloc) => bloc.add(GetAllPopularMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetPopularMoviesLoading(),
      GetPopularMoviesHasData(tMovieList),
    ],
    verify: (bloc) {
      verify(mockGetPopularMovies.execute());
    },
  );

  blocTest<GetPopularMovieBloc, PopularMoviesState>(
    'Should emit [Loading, Error] when get data popular movies is unsuccessful',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return getPopularMovieBloc;
    },
    act: (bloc) => bloc.add(GetAllPopularMovies()),
    expect: () => [
      GetPopularMoviesLoading(),
      const GetPopularMoviesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularMovies.execute());
    },
  );
}
