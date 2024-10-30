import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_alquran/api/sholat_api.dart';
import 'package:my_alquran/models/sholat/get_lokasi_models.dart';

part 'lokasi_event.dart';
part 'lokasi_state.dart';

class LokasiBloc extends Bloc<LokasiEvent, LokasiState> {
  LokasiBloc() : super(LokasiInitial()) {
    on<GetLokasi>((event, emit) async {
      try {
        final surah = await SholatApi().getLokasi(
          event.nameCity,
        );
        emit(LokasiLoded(surah));
      } catch (e) {
        emit(LokasiError(e.toString()));
      }
    });
  }
}
