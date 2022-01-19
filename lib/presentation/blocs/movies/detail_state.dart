part of 'detail_bloc.dart';

abstract class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

class GetDetailMovieEmpty extends DetailMovieState {}

class GetDetailMovieLoading extends DetailMovieState {}

class GetDetailMovieError extends DetailMovieState {
  final String message;

  const GetDetailMovieError(this.message);

  @override
  List<Object> get props => [message];
}

class GetDetailMovieHasData extends DetailMovieState {
  final MovieDetail detailResult;
  final List<Movie> recommendationResult;

  const GetDetailMovieHasData(this.detailResult, this.recommendationResult);

  @override
  List<Object> get props => [detailResult, recommendationResult];
}
