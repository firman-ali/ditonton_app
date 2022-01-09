import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/usecases/get_on_air_tv.dart';
import 'package:flutter/foundation.dart';

class OnAirTvNotifier extends ChangeNotifier {
  final GetOnAirTv getOnAirTv;

  OnAirTvNotifier({required this.getOnAirTv});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvSeries> _tvSeries = [];
  List<TvSeries> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchOnAirTv() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getOnAirTv.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (moviesData) {
        _tvSeries = moviesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
