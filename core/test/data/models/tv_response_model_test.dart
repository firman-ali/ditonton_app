import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test/json_reader.dart';

void main() {
  const tTvModel = TvModel(
    backdropPath: "/path.jpg",
    genreIds: [1, 2, 3, 4],
    id: 1,
    overview: "Overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    voteAverage: 1.0,
    voteCount: 1,
    name: 'Name',
    originalLanguage: 'Original Language',
    originalName: 'Original Name',
  );
  const tTvResponseModel = TvResponse(tvList: <TvModel>[tTvModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/airing_today_tv.json'));
      // act
      final result = TvResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "poster_path": "/path.jpg",
            "popularity": 1.0,
            "id": 1,
            "backdrop_path": "/path.jpg",
            "vote_average": 1.0,
            "overview": "Overview",
            "genre_ids": [1, 2, 3, 4],
            "original_language": "Original Language",
            "vote_count": 1,
            "name": "Name",
            "original_name": "Original Name"
          }
        ]
      };
      expect(result, expectedJsonMap);
    });
  });
}
