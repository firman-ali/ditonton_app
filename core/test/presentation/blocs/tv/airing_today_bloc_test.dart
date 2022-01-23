import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';
import '../../../../../test/helpers/test_helper.mocks.dart';

void main() {
  late GetAiringTodayTvBloc getTvListBloc;
  late MockGetAiringTodayTv mockAiringTodayTv;

  setUp(() {
    mockAiringTodayTv = MockGetAiringTodayTv();
    getTvListBloc = GetAiringTodayTvBloc(mockAiringTodayTv);
  });

  test('initial state should be empty', () {
    expect(getTvListBloc.state, GetAiringTodayTvEmpty());
  });

  blocTest<GetAiringTodayTvBloc, AiringTodayTvState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockAiringTodayTv.execute())
          .thenAnswer((_) async => const Right([]));
      return getTvListBloc;
    },
    act: (bloc) => bloc.add(GetAllAiringTodayTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetAiringTodayTvLoading(),
      GetAiringTodayTvEmpty(),
    ],
    verify: (bloc) {
      verify(mockAiringTodayTv.execute());
    },
  );

  blocTest<GetAiringTodayTvBloc, AiringTodayTvState>(
    'Should emit [Loading, HasData] when data airing today tv is gotten successfully',
    build: () {
      when(mockAiringTodayTv.execute())
          .thenAnswer((_) async => Right(testTvList));
      return getTvListBloc;
    },
    act: (bloc) => bloc.add(GetAllAiringTodayTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetAiringTodayTvLoading(),
      GetAiringTodayTvHasData(testTvList),
    ],
    verify: (bloc) {
      verify(mockAiringTodayTv.execute());
    },
  );

  blocTest<GetAiringTodayTvBloc, AiringTodayTvState>(
    'Should emit [Loading, Error] when get data airing today tv is unsuccessful',
    build: () {
      when(mockAiringTodayTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return getTvListBloc;
    },
    act: (bloc) => bloc.add(GetAllAiringTodayTv()),
    expect: () => [
      GetAiringTodayTvLoading(),
      const GetAiringTodayTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockAiringTodayTv.execute());
    },
  );
}
