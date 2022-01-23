import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tMovieTable = MovieTable(
    id: 0,
    overview: 'overview',
    posterPath: 'posterPath',
    title: 'title',
  );

  final expectedJson = {
    "id": 0,
    "title": "title",
    "posterPath": "posterPath",
    "overview": "overview",
  };

  test('should return a JSON map containing proper data', () async {
    final result = tMovieTable.toJson();
    expect(result, expectedJson);
  });
}
