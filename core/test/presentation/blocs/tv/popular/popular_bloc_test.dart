import 'package:core/core.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../test/dummy_data/dummy_objects.dart';
import 'popular_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTv])
void main() {
  late GetPopularTvBloc getPopularTvBloc;
  late MockGetPopularTv mockGetPopularTv;

  setUp(() {
    mockGetPopularTv = MockGetPopularTv();
    getPopularTvBloc = GetPopularTvBloc(mockGetPopularTv);
  });

  test('initial state should be empty', () {
    expect(getPopularTvBloc.state, GetPopularTvEmpty());
  });

  blocTest<GetPopularTvBloc, PopularTvState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockGetPopularTv.execute()).thenAnswer((_) async => const Right([]));
      return getPopularTvBloc;
    },
    act: (bloc) => bloc.add(GetAllPopularTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetPopularTvLoading(),
      GetPopularTvEmpty(),
    ],
    verify: (bloc) {
      verify(mockGetPopularTv.execute());
    },
  );

  blocTest<GetPopularTvBloc, PopularTvState>(
    'Should emit [Loading, HasData] when data popular tv is gotten successfully',
    build: () {
      when(mockGetPopularTv.execute())
          .thenAnswer((_) async => Right(testTvList));
      return getPopularTvBloc;
    },
    act: (bloc) => bloc.add(GetAllPopularTv()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetPopularTvLoading(),
      GetPopularTvHasData(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetPopularTv.execute());
    },
  );

  blocTest<GetPopularTvBloc, PopularTvState>(
    'Should emit [Loading, Error] when get data popular tv is unsuccessful',
    build: () {
      when(mockGetPopularTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return getPopularTvBloc;
    },
    act: (bloc) => bloc.add(GetAllPopularTv()),
    expect: () => [
      GetPopularTvLoading(),
      const GetPopularTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularTv.execute());
    },
  );
}
