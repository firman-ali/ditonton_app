import 'package:core/core.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/domain/usecases/get_watchlist_tv.dart';

part 'get_watchlist_event.dart';
part 'get_watchlist_state.dart';

class GetWatchlistTvBloc extends Bloc<WatchlistTvEvent, WatchlistTvState> {
  final GetWatchlistTv _getWatchlistTv;

  GetWatchlistTvBloc(this._getWatchlistTv) : super(WatchlistTvEmpty()) {
    on<GetAllWatchlistTv>((event, emit) async {
      emit(WatchlistTvLoading());
      final result = await _getWatchlistTv.execute();

      result.fold(
        (failure) {
          emit(WatchlistTvError(failure.message));
        },
        (data) {
          emit(WatchlistTvHasData(data));
        },
      );
    });
  }
}
