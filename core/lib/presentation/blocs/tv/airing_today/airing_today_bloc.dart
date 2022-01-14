import 'package:core/core.dart';

import 'package:bloc/bloc.dart';
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
          emit(GetAiringTodayTvHasData(data));
        },
      );
    });
  }
}
