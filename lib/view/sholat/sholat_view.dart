import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/models/sholat/get_jadwal_models.dart';
import 'package:my_alquran/view/sholat/jadwal_bloc/jadwal_bloc.dart';

class JadwalSholatPage extends StatefulWidget {
  const JadwalSholatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JadwalSholatPageState createState() => _JadwalSholatPageState();
}

class _JadwalSholatPageState extends State<JadwalSholatPage> {
  late JadwalBloc _jadwalBloc;

  @override
  void initState() {
    super.initState();
    _jadwalBloc = JadwalBloc();

    _jadwalBloc.add(const GetJawalSholat(
      idKota: 1407,
      tahun: 2024,
      bulan: 7,
      tanggal: 26,
    ));
  }

  @override
  void dispose() {
    _jadwalBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Sholat'),
      ),
      body: BlocProvider(
        create: (_) => _jadwalBloc,
        child: BlocBuilder<JadwalBloc, JadwalState>(
          builder: (context, state) {
            if (state is JadwalInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is JadwalLoaded) {
              return _buildJadwalDetails(state.getJadwal);
            } else if (state is JadwalError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildJadwalDetails(GetJadwalModels jadwal) {
    final data = jadwal.data;
    final jadwalSholat = data!.jadwal;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lokasi: ${data.lokasi}, ${data.daerah}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildJadwalItem('Tanggal', jadwalSholat!.tanggal!),
          _buildJadwalItem('Imsak', jadwalSholat.imsak!),
          _buildJadwalItem('Subuh', jadwalSholat.subuh!),
          _buildJadwalItem('Terbit', jadwalSholat.terbit!),
          _buildJadwalItem('Dhuha', jadwalSholat.dhuha!),
          _buildJadwalItem('Dzuhur', jadwalSholat.dzuhur!),
          _buildJadwalItem('Ashar', jadwalSholat.ashar!),
          _buildJadwalItem('Maghrib', jadwalSholat.maghrib!),
          _buildJadwalItem('Isya', jadwalSholat.isya!),
        ],
      ),
    );
  }

  Widget _buildJadwalItem(String label, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
