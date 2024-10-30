part of 'jadwal_bloc.dart';

sealed class JadwalState extends Equatable {
  const JadwalState();

  @override
  List<Object> get props => [];
}

final class JadwalInitial extends JadwalState {}

class JadwalLoaded extends JadwalState {
  final GetJadwalModels getJadwal;

  const JadwalLoaded(this.getJadwal);

  @override
  List<Object> get props => [getJadwal];
}

class JadwalError extends JadwalState {
  final String message;

  const JadwalError(this.message);

  @override
  List<Object> get props => [message];
}
