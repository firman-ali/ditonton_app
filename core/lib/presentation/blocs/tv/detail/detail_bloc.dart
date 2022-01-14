import 'package:core/core.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailTvBloc extends Bloc<DetailTvEvent, DetailTvState> {
  final GetTvDetail _getTvDetail;
  final GetTvRecommendations _getTvRecommendations;

  DetailTvBloc(
    this._getTvDetail,
    this._getTvRecommendations,
  ) : super(GetDetailTvEmpty()) {
    on<GetDetailTv>((event, emit) async {
      emit(GetDetailTvLoading());
      final id = event.id;

      final detailResult = await _getTvDetail.execute(id);
      final recommendationResult = await _getTvRecommendations.execute(id);

      detailResult.fold(
        (failure) {
          emit(GetDetailTvError(failure.message));
        },
        (detailData) {
          emit(GetDetailTvHasData(detailData, const []));
          recommendationResult.fold(
            (failure) {
              emit(GetDetailTvHasData(detailData, const []));
            },
            (recommendationData) {
              emit(GetDetailTvHasData(detailData, recommendationData));
            },
          );
        },
      );
    });
  }
}
