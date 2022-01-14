import 'package:core/core.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../test/dummy_data/dummy_objects.dart';
import 'top_rated_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedTv])
void main() {
  late GetTopRatedTvBloc getTopRatedTvBloc;
  late MockGetTopRatedTv mockGetTopRatedTv;

  setUp(() {
    mockGetTopRatedTv = MockGetTopRatedTv();
    getTopRatedTvBloc = GetTopRatedTvBloc(mockGetTopRatedTv);
  });

  test('initial state should be empty', () {
    expect(getTopRatedTvBloc.state, GetTopRatedTvEmpty());
  });

  blocTest<GetTopRatedTvBloc, TopRatedTvState>(
    'Should emit [Loading, Empty] when data top rated tv is gotten successfully',
    build: () {
      when(mockGetTopRatedTv.execute())
          .thenAnswer((_) async => const Right([]));
      return getTopRatedTvBloc;
    },
    act: (bloc) => bloc.add(GetAllTopRatedTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetTopRatedTvLoading(),
      GetTopRatedTvEmpty(),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTv.execute());
    },
  );

  blocTest<GetTopRatedTvBloc, TopRatedTvState>(
    'Should emit [Loading, HasData] when data top rated tv is gotten successfully',
    build: () {
      when(mockGetTopRatedTv.execute())
          .thenAnswer((_) async => Right(testTvList));
      return getTopRatedTvBloc;
    },
    act: (bloc) => bloc.add(GetAllTopRatedTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetTopRatedTvLoading(),
      GetTopRatedTvHasData(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTv.execute());
    },
  );

  blocTest<GetTopRatedTvBloc, TopRatedTvState>(
    'Should emit [Loading, Error] when get data top rated tvs is unsuccessful',
    build: () {
      when(mockGetTopRatedTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return getTopRatedTvBloc;
    },
    act: (bloc) => bloc.add(GetAllTopRatedTv()),
    expect: () => [
      GetTopRatedTvLoading(),
      const GetTopRatedTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTv.execute());
    },
  );
}
