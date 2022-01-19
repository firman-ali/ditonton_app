import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/presentation/blocs/tv/on_air_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetOnAirTvBloc getOnAirTvListBloc;
  late MockGetOnAirTv mockOnAirTv;

  setUp(() {
    mockOnAirTv = MockGetOnAirTv();
    getOnAirTvListBloc = GetOnAirTvBloc(mockOnAirTv);
  });

  test('initial state should be empty', () {
    expect(getOnAirTvListBloc.state, GetOnAirTvEmpty());
  });

  blocTest<GetOnAirTvBloc, OnAirTvState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockOnAirTv.execute()).thenAnswer((_) async => const Right([]));
      return getOnAirTvListBloc;
    },
    act: (bloc) => bloc.add(GetAllOnAirTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetOnAirTvLoading(),
      GetOnAirTvEmpty(),
    ],
    verify: (bloc) {
      verify(mockOnAirTv.execute());
    },
  );

  blocTest<GetOnAirTvBloc, OnAirTvState>(
    'Should emit [Loading, HasData] when data on air tv is gotten successfully',
    build: () {
      when(mockOnAirTv.execute()).thenAnswer((_) async => Right(testTvList));
      return getOnAirTvListBloc;
    },
    act: (bloc) => bloc.add(GetAllOnAirTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetOnAirTvLoading(),
      GetOnAirTvHasData(testTvList),
    ],
    verify: (bloc) {
      verify(mockOnAirTv.execute());
    },
  );

  blocTest<GetOnAirTvBloc, OnAirTvState>(
    'Should emit [Loading, Error] when get data on air tv is unsuccessful',
    build: () {
      when(mockOnAirTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return getOnAirTvListBloc;
    },
    act: (bloc) => bloc.add(GetAllOnAirTv()),
    expect: () => [
      GetOnAirTvLoading(),
      const GetOnAirTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockOnAirTv.execute());
    },
  );
}
