import 'package:core/core.dart';

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final testTvDetail = TvDetail(
  backdropPath: '/path.jpg',
  genres: [Genre(id: 1, name: 'Action')],
  homepage: "https://google.com",
  id: 1,
  overview: 'Overview',
  popularity: 1,
  posterPath: '/path.jpg',
  status: 'Status',
  tagline: 'Tagline',
  voteAverage: 1,
  voteCount: 1,
  firstAirDate: DateTime.parse("2000-01-01"),
  inProduction: false,
  lastAirDate: DateTime.parse("2000-01-01"),
  name: 'Name',
  nextEpisodeToAir: "2000-01-01",
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  originalName: 'Original Name',
  type: 'Type',
);

final testWatchlistTv = TvSeries.watchlist(
  id: 1,
  name: 'Name',
  posterPath: '/path.jpg',
  overview: 'Overview',
);

final testTvTable = TvTable(
  id: 1,
  name: 'Name',
  posterPath: '/path.jpg',
  overview: 'Overview',
);

final testTvMap = {
  'id': 1,
  'overview': 'Overview',
  'posterPath': '/path.jpg',
  'name': 'Name',
};

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: const [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTv = TvSeries(
  backdropPath: 'backdropPath',
  genreIds: [1],
  id: 1,
  name: 'name',
  originalLanguage: 'originalLanguage',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 0,
  posterPath: 'posterPath',
  voteAverage: 0,
  voteCount: 0,
);

final testTvList = [testTv];
