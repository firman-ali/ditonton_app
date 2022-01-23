import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test/dummy_data/dummy_objects.dart';
import '../../../../../test/helpers/test_helper.mocks.dart';

void main() {
  late DetailTvBloc detailTvBloc;
  late MockGetTvDetail mockGetTvDetail;
  late MockGetTvRecommendations mockGetTvRecommendations;

  setUp(() {
    mockGetTvDetail = MockGetTvDetail();
    mockGetTvRecommendations = MockGetTvRecommendations();
    detailTvBloc = DetailTvBloc(mockGetTvDetail, mockGetTvRecommendations);
  });

  test('initial state should be empty', () {
    expect(detailTvBloc.state, GetDetailTvEmpty());
  });

  blocTest<DetailTvBloc, DetailTvState>(
    'Should emit [Loading, HasData] when data detail tv is gotten successfully',
    build: () {
      when(mockGetTvDetail.execute(1))
          .thenAnswer((_) async => Right(testTvDetail));
      when(mockGetTvRecommendations.execute(1))
          .thenAnswer((_) async => const Right([]));
      return detailTvBloc;
    },
    act: (bloc) => bloc.add(GetDetailTv(1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetDetailTvLoading(),
      GetDetailTvHasData(testTvDetail, const []),
    ],
    verify: (bloc) {
      verify(mockGetTvDetail.execute(1));
      verify(mockGetTvRecommendations.execute(1));
    },
  );

  blocTest<DetailTvBloc, DetailTvState>(
    'Should emit [Loading, Error] when get data detail tv is unsuccessful',
    build: () {
      when(mockGetTvDetail.execute(1))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      when(mockGetTvRecommendations.execute(1))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return detailTvBloc;
    },
    act: (bloc) => bloc.add(GetDetailTv(1)),
    expect: () => [
      GetDetailTvLoading(),
      const GetDetailTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTvDetail.execute(1));
      verify(mockGetTvRecommendations.execute(1));
    },
  );
}
