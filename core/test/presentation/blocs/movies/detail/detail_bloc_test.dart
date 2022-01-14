import 'package:core/core.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../test/dummy_data/dummy_objects.dart';
import 'detail_bloc_test.mocks.dart';

@GenerateMocks([GetMovieDetail, GetMovieRecommendations])
void main() {
  late DetailMovieBloc detailMovieBloc;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    detailMovieBloc =
        DetailMovieBloc(mockGetMovieDetail, mockGetMovieRecommendations);
  });

  test('initial state should be empty', () {
    expect(detailMovieBloc.state, GetDetailMovieEmpty());
  });

  blocTest<DetailMovieBloc, DetailMovieState>(
    'Should emit [Loading, HasData] when data detail movies is gotten successfully',
    build: () {
      when(mockGetMovieDetail.execute(1))
          .thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(1))
          .thenAnswer((_) async => const Right([]));
      return detailMovieBloc;
    },
    act: (bloc) => bloc.add(GetDetailMovie(1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      GetDetailMovieLoading(),
      GetDetailMovieHasData(testMovieDetail, const []),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(1));
      verify(mockGetMovieRecommendations.execute(1));
    },
  );

  blocTest<DetailMovieBloc, DetailMovieState>(
    'Should emit [Loading, Error] when get data detail movies is unsuccessful',
    build: () {
      when(mockGetMovieDetail.execute(1))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      when(mockGetMovieRecommendations.execute(1))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return detailMovieBloc;
    },
    act: (bloc) => bloc.add(GetDetailMovie(1)),
    expect: () => [
      GetDetailMovieLoading(),
      const GetDetailMovieError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(1));
      verify(mockGetMovieRecommendations.execute(1));
    },
  );
}
