part of 'detail_bloc.dart';

abstract class DetailTvEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDetailTv extends DetailTvEvent {
  final int id;

  GetDetailTv(this.id);

  @override
  List<Object> get props => [id];
}
