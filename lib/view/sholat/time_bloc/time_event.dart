part of 'time_bloc.dart';

sealed class TimeEvent extends Equatable {
  const TimeEvent();
}

class GetTime extends TimeEvent {
  @override
  List<Object> get props => [];
}
