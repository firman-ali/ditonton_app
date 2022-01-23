import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class GetPopularTvBloc extends Bloc<PopularTvEvent, PopularTvState> {
  final GetPopularTv _getPopularTv;

  GetPopularTvBloc(
    this._getPopularTv,
  ) : super(GetPopularTvEmpty()) {
    on<GetAllPopularTv>((event, emit) async {
      emit(GetPopularTvLoading());
      final result = await _getPopularTv.execute();

      result.fold(
        (failure) {
          emit(GetPopularTvError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(GetPopularTvEmpty());
          } else {
            emit(GetPopularTvHasData(data));
          }
        },
      );
    });
  }
}
