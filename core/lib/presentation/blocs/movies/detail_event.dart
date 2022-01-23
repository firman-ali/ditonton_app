part of 'detail_bloc.dart';

abstract class DetailMovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDetailMovie extends DetailMovieEvent {
  final int id;

  GetDetailMovie(this.id);

  @override
  List<Object> get props => [id];
}
