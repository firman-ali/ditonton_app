import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/blocs/movies/top_rated_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopRatedMovieBloc getTopRatedMovieBloc;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  final tMovieList = <Movie>[testMovie];

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    getTopRatedMovieBloc = GetTopRatedMovieBloc(mockGetTopRatedMovies);
  });

  test('initial state should be empty', () {
    expect(getTopRatedMovieBloc.state, GetTopRatedMoviesEmpty());
  });

  blocTest<GetTopRatedMovieBloc, TopRatedMoviesState>(
    'Should emit [Loading, Empty] when data top rated movies is gotten successfully',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => const Right([]));
      return getTopRatedMovieBloc;
    },
    act: (bloc) => bloc.add(GetAllTopRatedMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetTopRatedMoviesLoading(),
      GetTopRatedMoviesEmpty(),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovies.execute());
    },
  );

  blocTest<GetTopRatedMovieBloc, TopRatedMoviesState>(
    'Should emit [Loading, HasData] when data top rated movies is gotten successfully',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return getTopRatedMovieBloc;
    },
    act: (bloc) => bloc.add(GetAllTopRatedMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetTopRatedMoviesLoading(),
      GetTopRatedMoviesHasData(tMovieList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovies.execute());
    },
  );

  blocTest<GetTopRatedMovieBloc, TopRatedMoviesState>(
    'Should emit [Loading, Error] when get data top rated movies is unsuccessful',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return getTopRatedMovieBloc;
    },
    act: (bloc) => bloc.add(GetAllTopRatedMovies()),
    expect: () => [
      GetTopRatedMoviesLoading(),
      const GetTopRatedMoviesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedMovies.execute());
    },
  );
}
