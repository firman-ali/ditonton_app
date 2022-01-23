import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetOnAirTv {
  final TvRepository repository;

  GetOnAirTv(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getOnAirTv();
  }
}
