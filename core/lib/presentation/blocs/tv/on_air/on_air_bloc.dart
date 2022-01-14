import 'package:core/core.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_air_event.dart';
part 'on_air_state.dart';

class GetOnAirTvBloc extends Bloc<OnAirTvEvent, OnAirTvState> {
  final GetOnAirTv _getOnAirTv;

  GetOnAirTvBloc(
    this._getOnAirTv,
  ) : super(GetOnAirTvEmpty()) {
    on<GetAllOnAirTv>((event, emit) async {
      emit(GetOnAirTvLoading());
      final result = await _getOnAirTv.execute();

      result.fold(
        (failure) {
          emit(GetOnAirTvError(failure.message));
        },
        (data) {
          emit(GetOnAirTvHasData(data));
        },
      );
    });
  }
}
