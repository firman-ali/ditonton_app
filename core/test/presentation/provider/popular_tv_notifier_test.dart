import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'popular_tv_notifier_test.mocks.dart';

@GenerateMocks([GetPopularTv])
void main() {
  late MockGetPopularTv mockGetPopularTv;
  late PopularTvNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetPopularTv = MockGetPopularTv();
    notifier = PopularTvNotifier(getPopularTv: mockGetPopularTv)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  const tTv = TvSeries(
    backdropPath: '/path.jpg',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'Overview',
    popularity: 1.0,
    posterPath: '/path.jpg',
    voteAverage: 1.0,
    voteCount: 1,
    name: 'Name',
    originalLanguage: 'Original Language',
    originalName: 'Original Name',
  );

  final tTvList = <TvSeries>[tTv];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetPopularTv.execute()).thenAnswer((_) async => Right(tTvList));
    // act
    notifier.fetchPopularTv();
    // assert
    expect(notifier.state, RequestState.isLoading);
    expect(listenerCallCount, 1);
  });

  test('should change tv data when data is gotten successfully', () async {
    // arrange
    when(mockGetPopularTv.execute()).thenAnswer((_) async => Right(tTvList));
    // act
    await notifier.fetchPopularTv();
    // assert
    expect(notifier.state, RequestState.isLoaded);
    expect(notifier.tvSeries, tTvList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetPopularTv.execute())
        .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchPopularTv();
    // assert
    expect(notifier.state, RequestState.isError);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
