part of 'jadwal_bloc.dart';

sealed class JadwalEvent extends Equatable {
  const JadwalEvent();
}

class GetJawalSholat extends JadwalEvent {
  final int idKota;
  final int tahun;
  final int bulan;
  final int tanggal;

  const GetJawalSholat(
      {required this.idKota,
      required this.tahun,
      required this.bulan,
      required this.tanggal});
  @override
  List<Object> get props => [idKota, tahun, bulan, tanggal];
}
