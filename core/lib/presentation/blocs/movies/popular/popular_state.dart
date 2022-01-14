part of 'popular_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class GetPopularMoviesEmpty extends PopularMoviesState {}

class GetPopularMoviesLoading extends PopularMoviesState {}

class GetPopularMoviesError extends PopularMoviesState {
  final String message;

  const GetPopularMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetPopularMoviesHasData extends PopularMoviesState {
  final List<Movie> result;

  const GetPopularMoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}
