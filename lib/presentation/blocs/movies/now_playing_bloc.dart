import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class GetNowPlayingMovieBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  GetNowPlayingMovieBloc(
    this._getNowPlayingMovies,
  ) : super(GetNowPlayingMoviesEmpty()) {
    on<GetAllNowPlayingMovies>((event, emit) async {
      emit(GetNowPlayingMoviesLoading());
      final result = await _getNowPlayingMovies.execute();

      result.fold(
        (failure) {
          emit(GetNowPlayingMoviesError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(GetNowPlayingMoviesEmpty());
          } else {
            emit(GetNowPlayingMoviesHasData(data));
          }
        },
      );
    });
  }
}
