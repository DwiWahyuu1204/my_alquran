part of 'lokasi_bloc.dart';

sealed class LokasiState extends Equatable {
  const LokasiState();

  @override
  List<Object> get props => [];
}

final class LokasiInitial extends LokasiState {}

class LokasiLoded extends LokasiState {
  final GetLokasiModels getTime;

  const LokasiLoded(this.getTime);

  @override
  List<Object> get props => [getTime];
}

class LokasiError extends LokasiState {
  final String message;

  const LokasiError(this.message);

  @override
  List<Object> get props => [message];
}
