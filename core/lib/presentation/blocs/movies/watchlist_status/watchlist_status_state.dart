part of 'watchlist_status_bloc.dart';

abstract class WatchlistStatusMovieState extends Equatable {
  const WatchlistStatusMovieState();

  @override
  List<Object> get props => [];
}

class InitWatchlistStatusMovie extends WatchlistStatusMovieState {}

class WatchlistStatusMovieError extends WatchlistStatusMovieState {
  final String message;

  const WatchlistStatusMovieError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistStatusMovieHasData extends WatchlistStatusMovieState {
  final bool watchlistStatus;

  const WatchlistStatusMovieHasData(this.watchlistStatus);

  @override
  List<Object> get props => [watchlistStatus];
}

class AddWatchlistMovieSuccess extends WatchlistStatusMovieState {
  final bool watchlistStatus;
  final String message;

  const AddWatchlistMovieSuccess(this.watchlistStatus, this.message);

  @override
  List<Object> get props => [watchlistStatus, message];
}

class RemoveWatchlistMovieSuccess extends WatchlistStatusMovieState {
  final bool watchlistStatus;
  final String message;

  const RemoveWatchlistMovieSuccess(this.watchlistStatus, this.message);

  @override
  List<Object> get props => [watchlistStatus, message];
}
