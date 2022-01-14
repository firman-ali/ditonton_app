import 'package:core/core.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_status_event.dart';
part 'watchlist_status_state.dart';

class WatchlistStatusTvBloc
    extends Bloc<WatchlistTvEvent, WatchlistStatusTvState> {
  final GetTvWatchlistStatus _getTvWatchlistStatus;
  final SaveTvWatchlist _saveWatchList;
  final RemoveTvWatchlist _removeWatchList;

  WatchlistStatusTvBloc(
    this._getTvWatchlistStatus,
    this._saveWatchList,
    this._removeWatchList,
  ) : super(InitWatchlistStatusTv()) {
    on<GetWatchlistStatusTv>((event, emit) async {
      final id = event.id;

      final watchlistStatus = await _getTvWatchlistStatus.execute(id);

      emit(WatchlistStatusTvHasData(watchlistStatus));
    });

    on<AddTvToWatchlist>((event, emit) async {
      final movie = event.movie;
      final result = await _saveWatchList.execute(movie);

      final watchlistStatus = await _getTvWatchlistStatus.execute(movie.id);

      await result.fold(
        (failure) async {
          // emit(GetWatchlistStatusTvError(failure.message));
        },
        (successMessage) async {
          emit(AddWatchlistTvSuccess(watchlistStatus, successMessage));
        },
      );
    });

    on<RemoveTvFromWatchlist>((event, emit) async {
      final movie = event.movie;
      final result = await _removeWatchList.execute(movie);

      final watchlistStatus = await _getTvWatchlistStatus.execute(movie.id);

      await result.fold(
        (failure) async {
          // emit(GetWatchlistStatusTvError(failure.message));
        },
        (successMessage) async {
          emit(RemoveWatchlistTvSuccess(watchlistStatus, successMessage));
        },
      );
    });
  }
}
