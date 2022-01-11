import 'package:core/core.dart';
import 'package:flutter/material.dart';

class TvListNotifier extends ChangeNotifier {
  var _airingTodayTv = <TvSeries>[];
  List<TvSeries> get airingTodayTv => _airingTodayTv;

  RequestState _airingTodayState = RequestState.isEmpty;
  RequestState get airingTodayState => _airingTodayState;

  var _onTheAirTv = <TvSeries>[];
  List<TvSeries> get onTheAirTv => _onTheAirTv;

  RequestState _onTheAirState = RequestState.isEmpty;
  RequestState get onTheAirState => _onTheAirState;

  var _popularTv = <TvSeries>[];
  List<TvSeries> get popularTv => _popularTv;

  RequestState _popularTvState = RequestState.isEmpty;
  RequestState get popularTvState => _popularTvState;

  var _topRatedTv = <TvSeries>[];
  List<TvSeries> get topRatedTv => _topRatedTv;

  RequestState _topRatedTvState = RequestState.isEmpty;
  RequestState get topRatedTvState => _topRatedTvState;

  String _message = '';
  String get message => _message;

  TvListNotifier({
    required this.getAiringTodayTv,
    required this.getOnAirTv,
    required this.getPopularTv,
    required this.getTopRatedTv,
  });

  final GetAiringTodayTv getAiringTodayTv;
  final GetOnAirTv getOnAirTv;
  final GetPopularTv getPopularTv;
  final GetTopRatedTv getTopRatedTv;

  Future<void> fetchAiringTodayTv() async {
    _airingTodayState = RequestState.isLoading;
    notifyListeners();

    final result = await getAiringTodayTv.execute();
    result.fold(
      (failure) {
        _airingTodayState = RequestState.isError;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _airingTodayState = RequestState.isLoaded;
        _airingTodayTv = moviesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchOnAirTv() async {
    _onTheAirState = RequestState.isLoading;
    notifyListeners();

    final result = await getOnAirTv.execute();
    result.fold(
      (failure) {
        _onTheAirState = RequestState.isError;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _onTheAirState = RequestState.isLoaded;
        _onTheAirTv = moviesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTv() async {
    _popularTvState = RequestState.isLoading;
    notifyListeners();

    final result = await getPopularTv.execute();
    result.fold(
      (failure) {
        _popularTvState = RequestState.isError;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _popularTvState = RequestState.isLoaded;
        _popularTv = moviesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTv() async {
    _topRatedTvState = RequestState.isLoading;
    notifyListeners();

    final result = await getTopRatedTv.execute();
    result.fold(
      (failure) {
        _topRatedTvState = RequestState.isError;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _topRatedTvState = RequestState.isLoaded;
        _topRatedTv = moviesData;
        notifyListeners();
      },
    );
  }
}
