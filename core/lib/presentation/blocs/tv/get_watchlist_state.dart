part of 'get_watchlist_bloc.dart';

abstract class GetWatchlistTvState extends Equatable {
  const GetWatchlistTvState();

  @override
  List<Object> get props => [];
}

class GetWatchlistTvEmpty extends GetWatchlistTvState {}

class GetWatchlistTvLoading extends GetWatchlistTvState {}

class GetWatchlistTvError extends GetWatchlistTvState {
  final String message;

  const GetWatchlistTvError(this.message);

  @override
  List<Object> get props => [message];
}

class GetWatchlistTvHasData extends GetWatchlistTvState {
  final List<TvSeries> result;

  const GetWatchlistTvHasData(this.result);

  @override
  List<Object> get props => [result];
}
