import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../test/helpers/test_helper.mocks.dart';

void main() {
  late GetTvRecommendations usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvRecommendations(mockTvRepository);
  });

  const tId = 1;
  final tTvs = <TvSeries>[];

  test('should get list of movie recommendations from the repository',
      () async {
    // arrange
    when(mockTvRepository.getTvRecommendations(tId))
        .thenAnswer((_) async => Right(tTvs));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(tTvs));
  });
}
