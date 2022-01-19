import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tTvModel = TvModel(
    backdropPath: '/path.jpg',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'Overview',
    popularity: 1,
    posterPath: '/path.jpg',
    voteAverage: 1,
    voteCount: 1,
    name: 'Name',
    originalLanguage: 'Original Language',
    originalName: 'Original Name',
  );

  const tTvSeries = TvSeries(
    backdropPath: '/path.jpg',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'Overview',
    popularity: 1,
    posterPath: '/path.jpg',
    voteAverage: 1,
    voteCount: 1,
    name: 'Name',
    originalLanguage: 'Original Language',
    originalName: 'Original Name',
  );

  test('should be a subclass of Movie entity', () async {
    final result = tTvModel.toEntity();
    expect(result, tTvSeries);
  });
}
