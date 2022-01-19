part of 'watchlist_status_bloc.dart';

abstract class WatchlistStatusTvState extends Equatable {
  const WatchlistStatusTvState();

  @override
  List<Object> get props => [];
}

class InitWatchlistStatusTv extends WatchlistStatusTvState {}

class WatchlistStatusTvError extends WatchlistStatusTvState {
  final String message;

  const WatchlistStatusTvError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistStatusTvHasData extends WatchlistStatusTvState {
  final bool watchlistStatus;

  const WatchlistStatusTvHasData(this.watchlistStatus);

  @override
  List<Object> get props => [watchlistStatus];
}

class AddWatchlistTvSuccess extends WatchlistStatusTvState {
  final bool watchlistStatus;
  final String message;

  const AddWatchlistTvSuccess(this.watchlistStatus, this.message);

  @override
  List<Object> get props => [watchlistStatus, message];
}

class RemoveWatchlistTvSuccess extends WatchlistStatusTvState {
  final bool watchlistStatus;
  final String message;

  const RemoveWatchlistTvSuccess(this.watchlistStatus, this.message);

  @override
  List<Object> get props => [watchlistStatus, message];
}
