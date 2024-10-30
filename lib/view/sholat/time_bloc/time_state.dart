part of 'time_bloc.dart';

sealed class TimeState extends Equatable {
  const TimeState();

  @override
  List<Object> get props => [];
}

final class TimeInitial extends TimeState {}

class TimeLoaded extends TimeState {
  final TimeData getTime;

  const TimeLoaded(this.getTime);

  @override
  List<Object> get props => [getTime];
}

class TimeError extends TimeState {
  final String message;

  const TimeError(this.message);

  @override
  List<Object> get props => [message];
}
