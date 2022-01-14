import 'package:core/core.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:search/search.dart';
import 'package:watchlist/watchlist.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => SearchMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SearchTvBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetWatchlistMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetWatchlistTvBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetNowPlayingMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetPopularMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetTopRatedMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => DetailMovieBloc(
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistStatusMovieBloc(
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetOnAirTvBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetAiringTodayTvBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetPopularTvBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetTopRatedTvBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => DetailTvBloc(
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistStatusTvBloc(
      locator(),
      locator(),
      locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetMovieWatchlistStatus(locator()));
  locator.registerLazySingleton(() => SaveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  locator.registerLazySingleton(() => GetAiringTodayTv(locator()));
  locator.registerLazySingleton(() => GetOnAirTv(locator()));
  locator.registerLazySingleton(() => GetPopularTv(locator()));
  locator.registerLazySingleton(() => GetTopRatedTv(locator()));
  locator.registerLazySingleton(() => GetTvDetail(locator()));
  locator.registerLazySingleton(() => GetTvRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTv(locator()));
  locator.registerLazySingleton(() => GetTvWatchlistStatus(locator()));
  locator.registerLazySingleton(() => SaveTvWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveTvWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistTv(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<TvRepository>(
    () => TvRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TvRemoteDataSource>(
      () => TvRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvLocalDataSource>(
      () => TvLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
