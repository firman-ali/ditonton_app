part of 'watchlist_status_bloc.dart';

abstract class WatchlistStatusMovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetWatchlistStatusMovie extends WatchlistStatusMovieEvent {
  final int id;

  GetWatchlistStatusMovie(this.id);

  @override
  List<Object> get props => [id];
}

class AddMovieToWatchlist extends WatchlistStatusMovieEvent {
  final MovieDetail movie;

  AddMovieToWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}

class RemoveMovieFromWatchlist extends WatchlistStatusMovieEvent {
  final MovieDetail movie;

  RemoveMovieFromWatchlist(this.movie);

  @override
  List<Object> get props => [movie];
}
