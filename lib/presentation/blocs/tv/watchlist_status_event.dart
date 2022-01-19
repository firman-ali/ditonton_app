part of 'watchlist_status_bloc.dart';

abstract class WatchlistTvEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetWatchlistStatusTv extends WatchlistTvEvent {
  final int id;

  GetWatchlistStatusTv(this.id);

  @override
  List<Object> get props => [id];
}

class AddTvToWatchlist extends WatchlistTvEvent {
  final TvDetail movie;

  AddTvToWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}

class RemoveTvFromWatchlist extends WatchlistTvEvent {
  final TvDetail movie;

  RemoveTvFromWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}
