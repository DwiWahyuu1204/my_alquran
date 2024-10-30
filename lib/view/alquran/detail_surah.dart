import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/view/alquran/surah_detail/surahdetail_bloc.dart';

class DetailSurahScreen extends StatelessWidget {
  final int surahNumber;

  const DetailSurahScreen({super.key, required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) =>
            SurahdetailBloc()..add(GetDetailSurah(surat: surahNumber)),
        child: BlocBuilder<SurahdetailBloc, SurahdetailState>(
          builder: (context, state) {
            if (state is SurahdetailInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SurahDetailLoaded) {
              var surah = state.suratModel.data;
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: surah.ayat.length,
                itemBuilder: (context, index) {
                  var ayah = surah.ayat[index];
                  return ListTile(
                    title: Text(
                      ayah.teksArab,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ayah.teksLatin,
                          style: const TextStyle(
                              fontSize: 16.0, fontStyle: FontStyle.italic),
                        ),
                        Text(
                          ayah.teksIndonesia,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  );
                },
              );
            } else if (state is SurahDetailError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
