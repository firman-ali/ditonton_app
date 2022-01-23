import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tMovieTable = TvTable(
    id: 0,
    overview: 'overview',
    posterPath: 'posterPath',
    name: 'title',
  );

  final expectedJson = {
    "id": 0,
    "name": "title",
    "posterPath": "posterPath",
    "overview": "overview",
  };

  test('should return a JSON map containing proper data', () async {
    final result = tMovieTable.toJson();
    expect(result, expectedJson);
  });
}
