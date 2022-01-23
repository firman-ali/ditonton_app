part of 'search_bloc.dart';

abstract class SearchTvsEvent extends Equatable {
  const SearchTvsEvent();

  @override
  List<Object> get props => [];
}

class OnTvsQueryChanged extends SearchTvsEvent {
  final String query;

  const OnTvsQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}
