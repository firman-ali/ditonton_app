import 'package:core/core.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../test/dummy_data/dummy_objects.dart';
import 'watchlist_status_bloc_test.mocks.dart';

@GenerateMocks([GetTvWatchlistStatus, SaveTvWatchlist, RemoveTvWatchlist])
void main() {
  late WatchlistStatusTvBloc watchlistStatusTvBloc;
  late MockGetTvWatchlistStatus mockGetTvWatchlistStatus;
  late MockSaveTvWatchlist mockSaveTvWatchlist;
  late MockRemoveTvWatchlist mockRemoveTvWatchlist;

  setUp(() {
    mockGetTvWatchlistStatus = MockGetTvWatchlistStatus();
    mockSaveTvWatchlist = MockSaveTvWatchlist();
    mockRemoveTvWatchlist = MockRemoveTvWatchlist();
    watchlistStatusTvBloc = WatchlistStatusTvBloc(
        mockGetTvWatchlistStatus, mockSaveTvWatchlist, mockRemoveTvWatchlist);
  });

  test('initial state should be empty', () {
    expect(watchlistStatusTvBloc.state, InitWatchlistStatusTv());
  });

  blocTest<WatchlistStatusTvBloc, WatchlistStatusTvState>(
    'Should emit [Loading, HasData] when tv is added to watchlist',
    build: () {
      when(mockGetTvWatchlistStatus.execute(1)).thenAnswer((_) async => true);
      return watchlistStatusTvBloc;
    },
    act: (bloc) => bloc.add(GetWatchlistStatusTv(1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const WatchlistStatusTvHasData(true),
    ],
    verify: (bloc) {
      verify(mockGetTvWatchlistStatus.execute(1));
    },
  );

  blocTest<WatchlistStatusTvBloc, WatchlistStatusTvState>(
    'Should emit [Loading, HasData] when tv is not added to watchlist',
    build: () {
      when(mockGetTvWatchlistStatus.execute(1)).thenAnswer((_) async => false);
      return watchlistStatusTvBloc;
    },
    act: (bloc) => bloc.add(GetWatchlistStatusTv(1)),
    expect: () => [
      const WatchlistStatusTvHasData(false),
    ],
    verify: (bloc) {
      verify(mockGetTvWatchlistStatus.execute(1));
    },
  );

  blocTest<WatchlistStatusTvBloc, WatchlistStatusTvState>(
    'Should emit Success when tv add to watchlist gotten successfully',
    build: () {
      when(mockSaveTvWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => const Right('success'));
      when(mockGetTvWatchlistStatus.execute(testTvDetail.id))
          .thenAnswer((_) async => true);
      return watchlistStatusTvBloc;
    },
    act: (bloc) => bloc.add(AddTvToWatchlist(testTvDetail)),
    expect: () => [
      const AddWatchlistTvSuccess(true, 'success'),
    ],
    verify: (bloc) {
      verify(mockSaveTvWatchlist.execute(testTvDetail));
    },
  );

  blocTest<WatchlistStatusTvBloc, WatchlistStatusTvState>(
    'Should emit Success when tv remove from watchlist gotten successfully',
    build: () {
      when(mockRemoveTvWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => const Right('success'));
      when(mockGetTvWatchlistStatus.execute(testTvDetail.id))
          .thenAnswer((_) async => false);
      return watchlistStatusTvBloc;
    },
    act: (bloc) => bloc.add(RemoveTvFromWatchlist(testTvDetail)),
    expect: () => [
      const RemoveWatchlistTvSuccess(false, 'success'),
    ],
    verify: (bloc) {
      verify(mockRemoveTvWatchlist.execute(testTvDetail));
    },
  );
}
