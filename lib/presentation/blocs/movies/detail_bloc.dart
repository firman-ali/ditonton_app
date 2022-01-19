import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final GetMovieDetail _getMovieDetail;
  final GetMovieRecommendations _getMovieRecommendations;

  DetailMovieBloc(
    this._getMovieDetail,
    this._getMovieRecommendations,
  ) : super(GetDetailMovieEmpty()) {
    on<GetDetailMovie>((event, emit) async {
      emit(GetDetailMovieLoading());
      final id = event.id;

      final detailResult = await _getMovieDetail.execute(id);
      final recommendationResult = await _getMovieRecommendations.execute(id);

      detailResult.fold(
        (failure) {
          emit(GetDetailMovieError(failure.message));
        },
        (detailData) {
          emit(GetDetailMovieHasData(detailData, const []));
          recommendationResult.fold(
            (failure) {
              emit(GetDetailMovieHasData(detailData, const []));
            },
            (recommendationData) {
              emit(GetDetailMovieHasData(detailData, recommendationData));
            },
          );
        },
      );
    });
  }
}
