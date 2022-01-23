part of 'top_rated_bloc.dart';

abstract class TopRatedTvState extends Equatable {
  const TopRatedTvState();

  @override
  List<Object> get props => [];
}

class GetTopRatedTvEmpty extends TopRatedTvState {}

class GetTopRatedTvLoading extends TopRatedTvState {}

class GetTopRatedTvError extends TopRatedTvState {
  final String message;

  const GetTopRatedTvError(this.message);

  @override
  List<Object> get props => [message];
}

class GetTopRatedTvHasData extends TopRatedTvState {
  final List<TvSeries> result;

  const GetTopRatedTvHasData(this.result);

  @override
  List<Object> get props => [result];
}
