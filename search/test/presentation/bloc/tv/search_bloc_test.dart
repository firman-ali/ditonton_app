import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/search.dart';

import 'search_bloc_test.mocks.dart';

@GenerateMocks([SearchTv])
void main() {
  late SearchTvBloc searchBloc;
  late MockSearchTv mockSearchTvs;

  setUp(() {
    mockSearchTvs = MockSearchTv();
    searchBloc = SearchTvBloc(mockSearchTvs);
  });

  test('initial state should be empty', () {
    expect(searchBloc.state, SearchTvsEmpty());
  });

  const tTvModel = TvSeries(
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalName: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    name: 'Spider-Man',
    voteAverage: 7.2,
    voteCount: 13507,
    originalLanguage: '',
  );
  final tTvList = <TvSeries>[tTvModel];
  const tQuery = 'spiderman';

  blocTest<SearchTvBloc, SearchTvsState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTvs.execute(tQuery))
          .thenAnswer((_) async => Right(tTvList));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnTvsQueryChanged(tQuery)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      SearchTvsLoading(),
      SearchTvsHasData(tTvList),
    ],
    verify: (bloc) {
      verify(mockSearchTvs.execute(tQuery));
    },
  );

  blocTest<SearchTvBloc, SearchTvsState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchTvs.execute(tQuery))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnTvsQueryChanged(tQuery)),
    expect: () => [
      SearchTvsLoading(),
      const SearchTvsError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchTvs.execute(tQuery));
    },
  );
}
