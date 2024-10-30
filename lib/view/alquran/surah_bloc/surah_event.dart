part of 'surah_bloc.dart';

sealed class SurahEvent extends Equatable {
  const SurahEvent();
}

class GetAllSurah extends SurahEvent {
  @override
  List<Object> get props => [];
}
