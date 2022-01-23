import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class RemoveTvWatchlist {
  final TvRepository repository;

  RemoveTvWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvDetail movie) {
    return repository.removeTvWatchlist(movie);
  }
}
