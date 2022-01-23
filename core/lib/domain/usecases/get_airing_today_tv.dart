import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetAiringTodayTv {
  final TvRepository repository;

  GetAiringTodayTv(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getAiringTodayTv();
  }
}
