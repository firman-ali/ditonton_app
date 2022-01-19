import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/usecases/get_on_air_tv.dart';
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
          if (data.isEmpty) {
            emit(GetOnAirTvEmpty());
          } else {
            emit(GetOnAirTvHasData(data));
          }
        },
      );
    });
  }
}
