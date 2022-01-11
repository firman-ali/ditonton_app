import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

class TopRatedTvNotifier extends ChangeNotifier {
  final GetTopRatedTv getTopRatedTv;

  TopRatedTvNotifier({required this.getTopRatedTv});

  RequestState _state = RequestState.isEmpty;
  RequestState get state => _state;

  List<TvSeries> _tvSeries = [];
  List<TvSeries> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedTv() async {
    _state = RequestState.isLoading;
    notifyListeners();

    final result = await getTopRatedTv.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.isError;
        notifyListeners();
      },
      (moviesData) {
        _tvSeries = moviesData;
        _state = RequestState.isLoaded;
        notifyListeners();
      },
    );
  }
}
