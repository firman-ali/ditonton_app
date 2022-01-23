import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';
import '../../../../../test/helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvBloc watchlistBloc;
  late MockGetWatchlistTv mockGetWatchlistTv;

  setUp(() {
    mockGetWatchlistTv = MockGetWatchlistTv();
    watchlistBloc = GetWatchlistTvBloc(mockGetWatchlistTv);
  });

  test('initial state should be empty', () {
    expect(watchlistBloc.state, GetWatchlistTvEmpty());
  });

  final tTvList = <TvSeries>[testTv];

  blocTest<GetWatchlistTvBloc, GetWatchlistTvState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistTv.execute())
          .thenAnswer((_) async => const Right([]));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetWatchlistTvLoading(),
      GetWatchlistTvEmpty(),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistTv.execute());
    },
  );

  blocTest<GetWatchlistTvBloc, GetWatchlistTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistTv.execute())
          .thenAnswer((_) async => Right(tTvList));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetWatchlistTvLoading(),
      GetWatchlistTvHasData(tTvList),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistTv.execute());
    },
  );

  blocTest<GetWatchlistTvBloc, GetWatchlistTvState>(
    'Should emit [Loading, Error] when get watchlist is unsuccessful',
    build: () {
      when(mockGetWatchlistTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistTv()),
    expect: () => [
      GetWatchlistTvLoading(),
      const GetWatchlistTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistTv.execute());
    },
  );
}
