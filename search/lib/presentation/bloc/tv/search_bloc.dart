import 'package:core/core.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search/domain/usecases/search_tv.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchTvBloc extends Bloc<SearchTvsEvent, SearchTvsState> {
  final SearchTv _searchTvs;

  SearchTvBloc(this._searchTvs) : super(WaitingSearchTv()) {
    on<OnTvsQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchTvsLoading());
      final result = await _searchTvs.execute(query);

      result.fold(
        (failure) {
          emit(SearchTvsError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(SearchTvsEmpty());
          } else {
            emit(SearchTvsHasData(data));
          }
        },
      );
    });
  }
}
