import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_watchlist_tv.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_watchlist_event.dart';
part 'get_watchlist_state.dart';

class GetWatchlistTvBloc
    extends Bloc<GetWatchlistTvEvent, GetWatchlistTvState> {
  final GetWatchlistTv _getWatchlistTv;

  GetWatchlistTvBloc(this._getWatchlistTv) : super(GetWatchlistTvEmpty()) {
    on<GetAllWatchlistTv>((event, emit) async {
      emit(GetWatchlistTvLoading());
      final result = await _getWatchlistTv.execute();

      result.fold(
        (failure) {
          emit(GetWatchlistTvError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(GetWatchlistTvEmpty());
          } else {
            emit(GetWatchlistTvHasData(data));
          }
        },
      );
    });
  }
}
