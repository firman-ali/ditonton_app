import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/blocs/movies/get_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistMoviesBloc watchlistBloc;
  late MockGetWatchlistMovies mockWatchlistMovies;

  setUp(() {
    mockWatchlistMovies = MockGetWatchlistMovies();
    watchlistBloc = GetWatchlistMoviesBloc(mockWatchlistMovies);
  });

  test('initial state should be empty', () {
    expect(watchlistBloc.state, GetWatchlistMoviesEmpty());
  });

  final tMovieList = <Movie>[testMovie];

  blocTest<GetWatchlistMoviesBloc, GetWatchlistMoviesState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockWatchlistMovies.execute())
          .thenAnswer((_) async => const Right([]));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetWatchlistMoviesLoading(),
      GetWatchlistMoviesEmpty(),
    ],
    verify: (bloc) {
      verify(mockWatchlistMovies.execute());
    },
  );

  blocTest<GetWatchlistMoviesBloc, GetWatchlistMoviesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockWatchlistMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetWatchlistMoviesLoading(),
      GetWatchlistMoviesHasData(tMovieList),
    ],
    verify: (bloc) {
      verify(mockWatchlistMovies.execute());
    },
  );

  blocTest<GetWatchlistMoviesBloc, GetWatchlistMoviesState>(
    'Should emit [Loading, Error] when get watchlist is unsuccessful',
    build: () {
      when(mockWatchlistMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistMovies()),
    expect: () => [
      GetWatchlistMoviesLoading(),
      const GetWatchlistMoviesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockWatchlistMovies.execute());
    },
  );
}
