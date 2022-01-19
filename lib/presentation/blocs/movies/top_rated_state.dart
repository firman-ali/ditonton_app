part of 'top_rated_bloc.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class GetTopRatedMoviesEmpty extends TopRatedMoviesState {}

class GetTopRatedMoviesLoading extends TopRatedMoviesState {}

class GetTopRatedMoviesError extends TopRatedMoviesState {
  final String message;

  const GetTopRatedMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetTopRatedMoviesHasData extends TopRatedMoviesState {
  final List<Movie> result;

  const GetTopRatedMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
