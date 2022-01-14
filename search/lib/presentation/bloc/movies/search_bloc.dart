import 'package:core/core.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search/domain/usecases/search_movies.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies _searchMovies;

  SearchMoviesBloc(this._searchMovies) : super(WaitingSearchMovie()) {
    on<OnMoviesQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchMoviesLoading());
      final result = await _searchMovies.execute(query);

      result.fold(
        (failure) {
          emit(SearchMoviesError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(SearchMoviesEmpty());
          } else {
            emit(SearchMoviesHasData(data));
          }
        },
      );
    });
  }
}
