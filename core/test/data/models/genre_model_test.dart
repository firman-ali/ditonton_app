import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tGenreModel = GenreModel(name: 'name', id: 0);

  const tGenre = Genre(name: 'name', id: 0);

  const expectedJson = {"id": 0, "name": "name"};

  test('should be a subclass of Genre entity', () async {
    final result = tGenreModel.toEntity();
    expect(result, tGenre);
  });

  test('should return a JSON map containing proper data', () async {
    final result = tGenreModel.toJson();
    expect(result, expectedJson);
  });
}
