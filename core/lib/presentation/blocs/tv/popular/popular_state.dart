part of 'popular_bloc.dart';

abstract class PopularTvState extends Equatable {
  const PopularTvState();

  @override
  List<Object> get props => [];
}

class GetPopularTvEmpty extends PopularTvState {}

class GetPopularTvLoading extends PopularTvState {}

class GetPopularTvError extends PopularTvState {
  final String message;

  const GetPopularTvError(this.message);

  @override
  List<Object> get props => [message];
}

class GetPopularTvHasData extends PopularTvState {
  final List<TvSeries> result;

  const GetPopularTvHasData(this.result);

  @override
  List<Object> get props => [result];
}
