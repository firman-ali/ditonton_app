part of 'airing_today_bloc.dart';

abstract class AiringTodayTvState extends Equatable {
  const AiringTodayTvState();

  @override
  List<Object> get props => [];
}

class GetAiringTodayTvEmpty extends AiringTodayTvState {}

class GetAiringTodayTvLoading extends AiringTodayTvState {}

class GetAiringTodayTvError extends AiringTodayTvState {
  final String message;

  const GetAiringTodayTvError(this.message);

  @override
  List<Object> get props => [message];
}

class GetAiringTodayTvHasData extends AiringTodayTvState {
  final List<TvSeries> result;

  const GetAiringTodayTvHasData(this.result);

  @override
  List<Object> get props => [result];
}
