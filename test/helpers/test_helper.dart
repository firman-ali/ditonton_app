import 'package:core/core.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:search/search.dart';

@GenerateMocks([
  GetNowPlayingMovies,
  GetPopularMovies,
  GetTopRatedMovies,
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchlistMovies,
  GetMovieWatchlistStatus,
  SaveMovieWatchlist,
  RemoveMovieWatchlist,
  SearchMovies,
  GetAiringTodayTv,
  GetOnAirTv,
  GetPopularTv,
  GetTopRatedTv,
  GetTvDetail,
  GetTvRecommendations,
  GetWatchlistTv,
  GetTvWatchlistStatus,
  SaveTvWatchlist,
  RemoveTvWatchlist,
  SearchTv,
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  TvRepository,
  TvRemoteDataSource,
  TvLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
