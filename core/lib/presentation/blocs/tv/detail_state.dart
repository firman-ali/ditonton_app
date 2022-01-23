part of 'detail_bloc.dart';

abstract class DetailTvState extends Equatable {
  const DetailTvState();

  @override
  List<Object> get props => [];
}

class GetDetailTvEmpty extends DetailTvState {}

class GetDetailTvLoading extends DetailTvState {}

class GetDetailTvError extends DetailTvState {
  final String message;

  const GetDetailTvError(this.message);

  @override
  List<Object> get props => [message];
}

class GetDetailTvHasData extends DetailTvState {
  final TvDetail detailResult;
  final List<TvSeries> recommendationResult;

  const GetDetailTvHasData(this.detailResult, this.recommendationResult);

  @override
  List<Object> get props => [detailResult, recommendationResult];
}
