part of 'bloc_bloc.dart';

abstract class Event extends Equatable {
  const Event();
}
class ListProductStarted extends Event{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
