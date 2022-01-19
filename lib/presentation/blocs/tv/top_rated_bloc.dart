import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class GetTopRatedTvBloc extends Bloc<TopRatedTvEvent, TopRatedTvState> {
  final GetTopRatedTv _getTopRatedTv;

  GetTopRatedTvBloc(
    this._getTopRatedTv,
  ) : super(GetTopRatedTvEmpty()) {
    on<GetAllTopRatedTv>((event, emit) async {
      emit(GetTopRatedTvLoading());
      final result = await _getTopRatedTv.execute();

      result.fold(
        (failure) {
          emit(GetTopRatedTvError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(GetTopRatedTvEmpty());
          } else {
            emit(GetTopRatedTvHasData(data));
          }
        },
      );
    });
  }
}
