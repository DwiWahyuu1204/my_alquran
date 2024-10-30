part of 'asmaulhusna_bloc.dart';

sealed class AsmaulhusnaState extends Equatable {
  const AsmaulhusnaState();

  @override
  List<Object> get props => [];
}

final class AsmaulhusnaInitial extends AsmaulhusnaState {}

class AsmaulhusnaLoaded extends AsmaulhusnaState {
  final List<Husna> asmaulhusna;

  const AsmaulhusnaLoaded(this.asmaulhusna);

  @override
  List<Object> get props => [asmaulhusna];
}

class AsmaulhusnaError extends AsmaulhusnaState {
  final String message;

  const AsmaulhusnaError(this.message);

  @override
  List<Object> get props => [message];
}
