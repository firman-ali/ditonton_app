part of 'on_air_bloc.dart';

abstract class OnAirTvState extends Equatable {
  const OnAirTvState();

  @override
  List<Object> get props => [];
}

class GetOnAirTvEmpty extends OnAirTvState {}

class GetOnAirTvLoading extends OnAirTvState {}

class GetOnAirTvError extends OnAirTvState {
  final String message;

  const GetOnAirTvError(this.message);

  @override
  List<Object> get props => [message];
}

class GetOnAirTvHasData extends OnAirTvState {
  final List<TvSeries> result;

  const GetOnAirTvHasData(this.result);

  @override
  List<Object> get props => [result];
}
