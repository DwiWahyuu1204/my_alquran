part of 'lokasi_bloc.dart';

sealed class LokasiEvent extends Equatable {
  const LokasiEvent();
}

class GetLokasi extends LokasiEvent {
  final String nameCity;

  const GetLokasi({required this.nameCity});
  @override
  List<Object> get props => [nameCity];
}
