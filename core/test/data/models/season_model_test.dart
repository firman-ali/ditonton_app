import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final date = DateTime.now();

  final tSeasonModel = SeasonModel(
    airDate: date,
    episodeCount: 0,
    id: 0,
    name: 'name',
    overview: 'overview',
    posterPath: 'posterPath',
    seasonNumber: 0,
  );

  final tSeason = Season(
    airDate: date,
    episodeCount: 0,
    id: 0,
    name: 'name',
    overview: 'overview',
    posterPath: 'posterPath',
    seasonNumber: 0,
  );

  final expectedJson = {
    "id": 0,
    "name": "name",
    "airDate": date,
    "episodeCount": 0,
    "overview": "overview",
    "posterPath": "posterPath",
    "seasonNumber": 0,
  };

  test('should be a subclass of Season entity', () async {
    final result = tSeasonModel.toEntity();
    expect(result, tSeason);
  });

  test('should return a JSON map containing proper data', () async {
    final result = tSeasonModel.toJson();
    expect(result, expectedJson);
  });
}
