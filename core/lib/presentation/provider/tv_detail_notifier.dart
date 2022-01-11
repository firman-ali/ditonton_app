import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TvDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvDetail getTvDetail;
  final GetTvRecommendations getTvRecommendations;
  final GetTvWatchListStatus getTvWatchListStatus;
  final SaveTvWatchlist saveTvWatchlist;
  final RemoveTvWatchlist removeTvWatchlist;

  TvDetailNotifier({
    required this.getTvDetail,
    required this.getTvRecommendations,
    required this.getTvWatchListStatus,
    required this.saveTvWatchlist,
    required this.removeTvWatchlist,
  });

  late TvDetail _tvSeries;
  TvDetail get tvSeries => _tvSeries;

  RequestState _tvState = RequestState.isEmpty;
  RequestState get tvState => _tvState;

  List<TvSeries> _tvRecommendations = [];
  List<TvSeries> get tvRecommendations => _tvRecommendations;

  RequestState _recommendationState = RequestState.isEmpty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> fetchTvDetail(int id) async {
    _tvState = RequestState.isLoading;
    notifyListeners();
    final detailResult = await getTvDetail.execute(id);
    final recommendationResult = await getTvRecommendations.execute(id);
    detailResult.fold(
      (failure) {
        _tvState = RequestState.isError;
        _message = failure.message;
        notifyListeners();
      },
      (movie) {
        _recommendationState = RequestState.isLoading;
        _tvSeries = movie;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.isError;
            _message = failure.message;
          },
          (movies) {
            if (movies.isNotEmpty) {
              _recommendationState = RequestState.isLoaded;
              _tvRecommendations = movies;
            } else {
              _recommendationState = RequestState.isEmpty;
            }
          },
        );
        _tvState = RequestState.isLoaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> addTvWatchlist(TvDetail movie) async {
    final result = await saveTvWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadTvWatchlistStatus(movie.id);
  }

  Future<void> removeTvFromWatchlist(TvDetail movie) async {
    final result = await removeTvWatchlist.execute(movie);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadTvWatchlistStatus(movie.id);
  }

  Future<void> loadTvWatchlistStatus(int id) async {
    final result = await getTvWatchListStatus.execute(id);
    _isAddedtoWatchlist = result;
    notifyListeners();
  }
}
