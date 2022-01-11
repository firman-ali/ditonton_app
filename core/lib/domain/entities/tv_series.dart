import 'package:equatable/equatable.dart';

class TvSeries extends Equatable {
  const TvSeries({
    required this.posterPath,
    required this.popularity,
    required this.id,
    required this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.name,
    required this.originalName,
  });

  const TvSeries.watchlist({
    this.popularity,
    this.backdropPath,
    this.voteAverage,
    this.genreIds,
    this.originalLanguage,
    this.voteCount,
    this.originalName,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
  });

  final String? posterPath;
  final double? popularity;
  final int? id;
  final String? backdropPath;
  final double? voteAverage;
  final String? overview;
  final List<int>? genreIds;
  final String? originalLanguage;
  final int? voteCount;
  final String? name;
  final String? originalName;

  @override
  List<Object?> get props => [
        posterPath,
        popularity,
        id,
        backdropPath,
        voteAverage,
        overview,
        genreIds,
        originalLanguage,
        voteCount,
        name,
        originalName,
      ];
}
