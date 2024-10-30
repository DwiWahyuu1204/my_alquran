import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_alquran/api/sholat_api.dart';
import 'package:my_alquran/models/sholat/get_jadwal_models.dart';

part 'jadwal_event.dart';
part 'jadwal_state.dart';

class JadwalBloc extends Bloc<JadwalEvent, JadwalState> {
  JadwalBloc() : super(JadwalInitial()) {
    on<GetJawalSholat>((event, emit) async {
      try {
        final jadwal = await SholatApi().getJadwalSholat(
            event.idKota, event.tahun, event.bulan, event.tanggal);
        emit(JadwalLoaded(jadwal));
      } catch (e) {
        emit(JadwalError(e.toString()));
      }
    });
  }
}
