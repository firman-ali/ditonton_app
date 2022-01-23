import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';
import '../../../../../test/helpers/test_helper.mocks.dart';

void main() {
  late WatchlistStatusMovieBloc watchlistStatusMovieBloc;
  late MockGetMovieWatchlistStatus mockGetMovieWatchlistStatus;
  late MockSaveMovieWatchlist mockSaveMovieWatchlist;
  late MockRemoveMovieWatchlist mockRemoveMovieWatchlist;

  setUp(() {
    mockGetMovieWatchlistStatus = MockGetMovieWatchlistStatus();
    mockSaveMovieWatchlist = MockSaveMovieWatchlist();
    mockRemoveMovieWatchlist = MockRemoveMovieWatchlist();
    watchlistStatusMovieBloc = WatchlistStatusMovieBloc(
        mockGetMovieWatchlistStatus,
        mockSaveMovieWatchlist,
        mockRemoveMovieWatchlist);
  });

  test('initial state should be empty', () {
    expect(watchlistStatusMovieBloc.state, InitWatchlistStatusMovie());
  });

  blocTest<WatchlistStatusMovieBloc, WatchlistStatusMovieState>(
    'Should emit [Loading, HasData] when movies is added to watchlist',
    build: () {
      when(mockGetMovieWatchlistStatus.execute(1))
          .thenAnswer((_) async => true);
      return watchlistStatusMovieBloc;
    },
    act: (bloc) => bloc.add(GetWatchlistStatusMovie(1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const WatchlistStatusMovieHasData(true),
    ],
    verify: (bloc) {
      verify(mockGetMovieWatchlistStatus.execute(1));
    },
  );

  blocTest<WatchlistStatusMovieBloc, WatchlistStatusMovieState>(
    'Should emit [Loading, HasData] when movies is not added to watchlist',
    build: () {
      when(mockGetMovieWatchlistStatus.execute(1))
          .thenAnswer((_) async => false);
      return watchlistStatusMovieBloc;
    },
    act: (bloc) => bloc.add(GetWatchlistStatusMovie(1)),
    expect: () => [
      const WatchlistStatusMovieHasData(false),
    ],
    verify: (bloc) {
      verify(mockGetMovieWatchlistStatus.execute(1));
    },
  );

  blocTest<WatchlistStatusMovieBloc, WatchlistStatusMovieState>(
    'Should emit Success when movies add to watchlist gotten successfully',
    build: () {
      when(mockSaveMovieWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('success'));
      when(mockGetMovieWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => true);
      return watchlistStatusMovieBloc;
    },
    act: (bloc) => bloc.add(AddMovieToWatchlist(testMovieDetail)),
    expect: () => [
      const AddWatchlistMovieSuccess(true, 'success'),
    ],
    verify: (bloc) {
      verify(mockSaveMovieWatchlist.execute(testMovieDetail));
    },
  );

  blocTest<WatchlistStatusMovieBloc, WatchlistStatusMovieState>(
    'Should emit Success when movies remove from watchlist gotten successfully',
    build: () {
      when(mockRemoveMovieWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('success'));
      when(mockGetMovieWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => false);
      return watchlistStatusMovieBloc;
    },
    act: (bloc) => bloc.add(RemoveMovieFromWatchlist(testMovieDetail)),
    expect: () => [
      const RemoveWatchlistMovieSuccess(false, 'success'),
    ],
    verify: (bloc) {
      verify(mockRemoveMovieWatchlist.execute(testMovieDetail));
    },
  );
}
