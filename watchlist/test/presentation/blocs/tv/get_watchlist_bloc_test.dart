import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/domain/usecases/get_watchlist_tv.dart';
import 'package:watchlist/presentation/blocs/tv/get_watchlist_bloc.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';
import 'get_watchlist_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistTv])
void main() {
  late GetWatchlistTvBloc watchlistBloc;
  late MockGetWatchlistTv mockWatchlistTv;

  setUp(() {
    mockWatchlistTv = MockGetWatchlistTv();
    watchlistBloc = GetWatchlistTvBloc(mockWatchlistTv);
  });

  test('initial state should be empty', () {
    expect(watchlistBloc.state, GetWatchlistTvEmpty());
  });

  final tTvList = <TvSeries>[testTv];

  blocTest<GetWatchlistTvBloc, GetWatchlistTvState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockWatchlistTv.execute()).thenAnswer((_) async => Right([]));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetWatchlistTvLoading(),
      GetWatchlistTvEmpty(),
    ],
    verify: (bloc) {
      verify(mockWatchlistTv.execute());
    },
  );

  blocTest<GetWatchlistTvBloc, GetWatchlistTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockWatchlistTv.execute()).thenAnswer((_) async => Right(tTvList));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetWatchlistTvLoading(),
      GetWatchlistTvHasData(tTvList),
    ],
    verify: (bloc) {
      verify(mockWatchlistTv.execute());
    },
  );

  blocTest<GetWatchlistTvBloc, GetWatchlistTvState>(
    'Should emit [Loading, Error] when get watchlist is unsuccessful',
    build: () {
      when(mockWatchlistTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return watchlistBloc;
    },
    act: (bloc) => bloc.add(GetAllWatchlistTv()),
    expect: () => [
      GetWatchlistTvLoading(),
      const GetWatchlistTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockWatchlistTv.execute());
    },
  );
}
