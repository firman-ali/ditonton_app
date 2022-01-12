import 'package:core/core.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/domain/usecases/get_watchlist_movies.dart';

part 'get_watchlist_event.dart';
part 'get_watchlist_state.dart';

class GetWatchlistMoviesBloc
    extends Bloc<WatchlistMoviesEvent, WatchlistMoviesState> {
  final GetWatchlistMovies _getWatchlistMovies;

  GetWatchlistMoviesBloc(this._getWatchlistMovies)
      : super(WatchlistMoviesEmpty()) {
    on<GetAllWatchlistMovies>((event, emit) async {
      emit(WatchlistMoviesLoading());
      final result = await _getWatchlistMovies.execute();

      result.fold(
        (failure) {
          emit(WatchlistMoviesError(failure.message));
        },
        (data) {
          emit(WatchlistMoviesHasData(data));
        },
      );
    });
  }
}
