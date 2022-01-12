import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/domain/usecases/get_watchlist_movies.dart';
import 'package:watchlist/presentation/blocs/movies/get_watchlist_bloc.dart';

import 'search_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late GetWatchlistMoviesBloc watchlistBloc;
  late MockGetWatchlistMovies mockWatchlistMovies;

  setUp(() {
    mockWatchlistMovies = MockGetWatchlistMovies();
    watchlistBloc = GetWatchlistMoviesBloc(mockWatchlistMovies);
  });

  test('initial state should be empty', () {
    expect(watchlistBloc.state, WatchlistMoviesEmpty());
  });

  const tMovieModel = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tMovieList = <Movie>[tMovieModel];

  blocTest<GetWatchlistMoviesBloc, WatchlistMoviesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockWatchlistMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistMovies()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistMoviesLoading(),
      WatchlistMoviesHasData(tMovieList),
    ],
    verify: (bloc) {
      verify(mockWatchlistMovies.execute());
    },
  );

  blocTest<GetWatchlistMoviesBloc, WatchlistMoviesState>(
    'Should emit [Loading, Error] when get watchlist is unsuccessful',
    build: () {
      when(mockWatchlistMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistMovies()),
    expect: () => [
      WatchlistMoviesLoading(),
      const WatchlistMoviesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockWatchlistMovies.execute());
    },
  );
}
