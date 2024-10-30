part of 'surahdetail_bloc.dart';

sealed class SurahdetailState extends Equatable {
  const SurahdetailState();

  @override
  List<Object> get props => [];
}

final class SurahdetailInitial extends SurahdetailState {}

class SurahDetailLoaded extends SurahdetailState {
  final SurahDetail suratModel;

  const SurahDetailLoaded(this.suratModel);

  @override
  List<Object> get props => [suratModel];
}

class SurahDetailError extends SurahdetailState {
  final String message;

  const SurahDetailError(this.message);

  @override
  List<Object> get props => [message];
}
