import 'package:core/domain/entities/season.dart';
import 'package:equatable/equatable.dart';

class SeasonModel extends Equatable {
  const SeasonModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  final DateTime airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        id: json["id"],
        name: json["name"],
        airDate: json["airDate"],
        episodeCount: json["episodeCount"],
        overview: json["overview"],
        posterPath: json["posterPath"],
        seasonNumber: json["seasonNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "airDate": airDate,
        "episodeCount": episodeCount,
        "overview": overview,
        "posterPath": posterPath,
        "seasonNumber": seasonNumber,
      };

  Season toEntity() {
    return Season(
      id: id,
      name: name,
      airDate: airDate,
      episodeCount: episodeCount,
      overview: overview,
      posterPath: posterPath,
      seasonNumber: seasonNumber,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        airDate,
        episodeCount,
        overview,
        posterPath,
        seasonNumber,
      ];
}
