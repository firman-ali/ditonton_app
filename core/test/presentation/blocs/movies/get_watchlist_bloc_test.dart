import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';
import '../../../../../test/helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistMoviesBloc watchlistBloc;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    watchlistBloc = GetWatchlistMoviesBloc(mockGetWatchlistMovies);
  });

  test('initial state should be empty', () {
    expect(watchlistBloc.state, GetWatchlistMoviesEmpty());
  });

  final tMovieList = <Movie>[testMovie];

  blocTest<GetWatchlistMoviesBloc, GetWatchlistMoviesState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistMovies.execute())
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
      verify(mockGetWatchlistMovies.execute());
    },
  );

  blocTest<GetWatchlistMoviesBloc, GetWatchlistMoviesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistMovies.execute())
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
      verify(mockGetWatchlistMovies.execute());
    },
  );

  blocTest<GetWatchlistMoviesBloc, GetWatchlistMoviesState>(
    'Should emit [Loading, Error] when get watchlist is unsuccessful',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistMovies()),
    expect: () => [
      GetWatchlistMoviesLoading(),
      const GetWatchlistMoviesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistMovies.execute());
    },
  );
}
