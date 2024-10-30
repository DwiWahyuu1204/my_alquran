import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_alquran/api/surah_api.dart';
import 'package:my_alquran/models/alquran/surah_detail.dart';

part 'surahdetail_event.dart';
part 'surahdetail_state.dart';

class SurahdetailBloc extends Bloc<SurahdetailEvent, SurahdetailState> {
  SurahdetailBloc() : super(SurahdetailInitial()) {
    on<GetDetailSurah>((event, emit) async {
      try {
        final surah = await SurahApi().getDetailSurah(
          event.surat,
        );
        emit(SurahDetailLoaded(surah));
      } catch (e) {
        emit(SurahDetailError(e.toString()));
      }
    });
  }
}
