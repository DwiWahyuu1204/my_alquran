import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_alquran/api/surah_api.dart';

import '../../../models/alquran/surah_models.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  SurahBloc() : super(SurahInitial()) {
    on<GetAllSurah>((event, emit) async {
      try {
        final List<Map<String, dynamic>> mapList =
            await SurahApi().getSurahList();
        final List<Surah> surahs =
            mapList.map((map) => Surah.fromMap(map)).toList();
        emit(SurahLoaded(surahs));
      } catch (e) {
        emit(SurahError(e.toString()));
      }
    });
  }
}
