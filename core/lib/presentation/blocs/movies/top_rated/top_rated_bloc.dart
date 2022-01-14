import 'package:core/core.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class GetTopRatedMovieBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMovies _getTopRatedMovies;

  GetTopRatedMovieBloc(
    this._getTopRatedMovies,
  ) : super(GetTopRatedMoviesEmpty()) {
    on<GetAllTopRatedMovies>((event, emit) async {
      emit(GetTopRatedMoviesLoading());
      final result = await _getTopRatedMovies.execute();

      result.fold(
        (failure) {
          emit(GetTopRatedMoviesError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(GetTopRatedMoviesEmpty());
          } else {
            emit(GetTopRatedMoviesHasData(data));
          }
        },
      );
    });
  }
}
