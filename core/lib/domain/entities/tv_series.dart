import 'package:equatable/equatable.dart';

class TvSeries extends Equatable {
  TvSeries({
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

  TvSeries.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.name,
  });

  late String? posterPath;
  late double? popularity;
  late int? id;
  late String? backdropPath;
  late double? voteAverage;
  late String? overview;
  late List<int>? genreIds;
  late String? originalLanguage;
  late int? voteCount;
  late String? name;
  late String? originalName;

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
