import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:watchlist/domain/usecases/get_watchlist_tv.dart';

class WatchlistTvNotifier extends ChangeNotifier {
  var _watchlistTv = <TvSeries>[];
  List<TvSeries> get watchlistTv => _watchlistTv;

  var _watchlistState = RequestState.isEmpty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistTvNotifier({required this.getWatchlistTv});

  final GetWatchlistTv getWatchlistTv;

  Future<void> fetchWatchlistTv() async {
    _watchlistState = RequestState.isLoading;
    notifyListeners();

    final result = await getWatchlistTv.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.isError;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _watchlistState = RequestState.isLoaded;
        _watchlistTv = moviesData;
        notifyListeners();
      },
    );
  }
}
