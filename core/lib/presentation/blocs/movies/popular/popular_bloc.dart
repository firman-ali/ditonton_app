import 'package:core/core.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class GetPopularMovieBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies _getPopularMovies;

  GetPopularMovieBloc(
    this._getPopularMovies,
  ) : super(GetPopularMoviesEmpty()) {
    on<GetAllPopularMovies>((event, emit) async {
      emit(GetPopularMoviesLoading());
      final result = await _getPopularMovies.execute();

      result.fold(
        (failure) {
          emit(GetPopularMoviesError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(GetPopularMoviesEmpty());
          } else {
            emit(GetPopularMoviesHasData(data));
          }
        },
      );
    });
  }
}
