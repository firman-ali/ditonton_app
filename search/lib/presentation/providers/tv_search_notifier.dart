import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:search/domain/usecases/search_tv.dart';

class TvSearchNotifier extends ChangeNotifier {
  final SearchTv searchTv;

  TvSearchNotifier({required this.searchTv});

  RequestState _state = RequestState.isEmpty;
  RequestState get state => _state;

  List<TvSeries> _searchResult = [];
  List<TvSeries> get searchResult => _searchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchTvSearch(String query) async {
    _state = RequestState.isLoading;
    notifyListeners();

    final result = await searchTv.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.isError;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.isLoaded;
        notifyListeners();
      },
    );
  }
}
