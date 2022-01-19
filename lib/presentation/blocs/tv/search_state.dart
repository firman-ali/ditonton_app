part of 'search_bloc.dart';

abstract class SearchTvsState extends Equatable {
  const SearchTvsState();

  @override
  List<Object> get props => [];
}

class WaitingSearchTv extends SearchTvsState {}

class SearchTvsEmpty extends SearchTvsState {}

class SearchTvsLoading extends SearchTvsState {}

class SearchTvsError extends SearchTvsState {
  final String message;

  const SearchTvsError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchTvsHasData extends SearchTvsState {
  final List<TvSeries> result;

  const SearchTvsHasData(this.result);

  @override
  List<Object> get props => [result];
}
