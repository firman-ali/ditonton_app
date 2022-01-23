part of 'now_playing_bloc.dart';

abstract class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEmpty extends NowPlayingMoviesState {}

class GetNowPlayingMoviesLoading extends NowPlayingMoviesState {}

class GetNowPlayingMoviesError extends NowPlayingMoviesState {
  final String message;

  const GetNowPlayingMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetNowPlayingMoviesHasData extends NowPlayingMoviesState {
  final List<Movie> result;

  const GetNowPlayingMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
