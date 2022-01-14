import 'package:core/core.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_status_event.dart';
part 'watchlist_status_state.dart';

class WatchlistStatusMovieBloc
    extends Bloc<WatchlistStatusMovieEvent, WatchlistStatusMovieState> {
  final GetMovieWatchlistStatus _getMovieWatchListStatus;
  final SaveMovieWatchlist _saveWatchList;
  final RemoveMovieWatchlist _removeWatchList;

  WatchlistStatusMovieBloc(
    this._getMovieWatchListStatus,
    this._saveWatchList,
    this._removeWatchList,
  ) : super(InitWatchlistStatusMovie()) {
    on<GetWatchlistStatusMovie>((event, emit) async {
      final id = event.id;

      final watchlistStatus = await _getMovieWatchListStatus.execute(id);

      emit(WatchlistStatusMovieHasData(watchlistStatus));
    });

    on<AddMovieToWatchlist>((event, emit) async {
      final movie = event.movie;
      final result = await _saveWatchList.execute(movie);

      final watchlistStatus = await _getMovieWatchListStatus.execute(movie.id);

      await result.fold(
        (failure) async {
          // emit(GetWatchlistStatusMovieError(failure.message));
        },
        (successMessage) async {
          emit(AddWatchlistMovieSuccess(watchlistStatus, successMessage));
        },
      );
    });

    on<RemoveMovieFromWatchlist>((event, emit) async {
      final movie = event.movie;
      final result = await _removeWatchList.execute(movie);

      final watchlistStatus = await _getMovieWatchListStatus.execute(movie.id);

      await result.fold(
        (failure) async {
          // emit(GetWatchlistStatusMovieError(failure.message));
        },
        (successMessage) async {
          emit(RemoveWatchlistMovieSuccess(watchlistStatus, successMessage));
        },
      );
    });
  }
}
