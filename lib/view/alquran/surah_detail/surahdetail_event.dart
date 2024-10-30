part of 'surahdetail_bloc.dart';

sealed class SurahdetailEvent extends Equatable {
  const SurahdetailEvent();
}

class GetDetailSurah extends SurahdetailEvent {
  final int surat;

  const GetDetailSurah({required this.surat});
  @override
  List<Object> get props => [surat];
}
