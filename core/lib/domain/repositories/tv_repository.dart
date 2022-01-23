import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TvSeries>>> getAiringTodayTv();
  Future<Either<Failure, List<TvSeries>>> getOnAirTv();
  Future<Either<Failure, List<TvSeries>>> getPopularTv();
  Future<Either<Failure, List<TvSeries>>> getTopRatedTv();
  Future<Either<Failure, TvDetail>> getTvDetail(int id);
  Future<Either<Failure, List<TvSeries>>> getTvRecommendations(int id);
  Future<Either<Failure, List<TvSeries>>> searchTv(String query);
  Future<Either<Failure, String>> saveTvWatchlist(TvDetail movie);
  Future<Either<Failure, String>> removeTvWatchlist(TvDetail movie);
  Future<bool> tvIsAddedToWatchlist(int id);
  Future<Either<Failure, List<TvSeries>>> getWatchlistTv();
}
