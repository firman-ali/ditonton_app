import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_airing_today_tv.dart';
import 'package:equatable/equatable.dart';

part 'airing_today_event.dart';
part 'airing_today_state.dart';

class GetAiringTodayTvBloc
    extends Bloc<AiringTodayTvEvent, AiringTodayTvState> {
  final GetAiringTodayTv _getAiringTodayTv;

  GetAiringTodayTvBloc(
    this._getAiringTodayTv,
  ) : super(GetAiringTodayTvEmpty()) {
    on<GetAllAiringTodayTv>((event, emit) async {
      emit(GetAiringTodayTvLoading());
      final result = await _getAiringTodayTv.execute();

      result.fold(
        (failure) {
          emit(GetAiringTodayTvError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(GetAiringTodayTvEmpty());
          } else {
            emit(GetAiringTodayTvHasData(data));
          }
        },
      );
    });
  }
}
