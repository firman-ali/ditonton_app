import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

class PopularTvNotifier extends ChangeNotifier {
  final GetPopularTv getPopularTv;

  PopularTvNotifier({required this.getPopularTv});

  RequestState _state = RequestState.isEmpty;
  RequestState get state => _state;

  List<TvSeries> _tvSeries = [];
  List<TvSeries> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularTv() async {
    _state = RequestState.isLoading;
    notifyListeners();

    final result = await getPopularTv.execute();

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
