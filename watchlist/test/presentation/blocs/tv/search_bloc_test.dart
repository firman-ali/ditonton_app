import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/domain/usecases/get_watchlist_tv.dart';
import 'package:watchlist/presentation/blocs/tv/get_watchlist_bloc.dart';

import 'search_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistTv])
void main() {
  late GetWatchlistTvBloc watchlistBloc;
  late MockGetWatchlistTv mockWatchlistTv;

  setUp(() {
    mockWatchlistTv = MockGetWatchlistTv();
    watchlistBloc = GetWatchlistTvBloc(mockWatchlistTv);
  });

  test('initial state should be empty', () {
    expect(watchlistBloc.state, WatchlistTvEmpty());
  });

  const tTvModel = TvSeries(
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalName: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    name: 'Spider-Man',
    voteAverage: 7.2,
    voteCount: 13507,
    originalLanguage: '',
  );
  final tTvList = <TvSeries>[tTvModel];

  blocTest<GetWatchlistTvBloc, WatchlistTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockWatchlistTv.execute()).thenAnswer((_) async => Right(tTvList));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistTvLoading(),
      WatchlistTvHasData(tTvList),
    ],
    verify: (bloc) {
      verify(mockWatchlistTv.execute());
    },
  );

  blocTest<GetWatchlistTvBloc, WatchlistTvState>(
    'Should emit [Loading, Error] when get watchlist is unsuccessful',
    build: () {
      when(mockWatchlistTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistTv()),
    expect: () => [
      WatchlistTvLoading(),
      const WatchlistTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockWatchlistTv.execute());
    },
  );
}
