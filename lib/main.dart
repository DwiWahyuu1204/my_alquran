import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/view/alquran/surah_bloc/surah_bloc.dart';
import 'package:my_alquran/view/alquran/surah_detail/surahdetail_bloc.dart';
import 'package:my_alquran/view/asmaulhusna/asmaulhusnaa_bloc/asmaulhusna_bloc.dart';
import 'package:my_alquran/view/sholat/jadwal_bloc/jadwal_bloc.dart';
import 'package:my_alquran/view/sholat/lokasi_bloc/lokasi_bloc.dart';
import 'package:my_alquran/view/sholat/time_bloc/time_bloc.dart';
import 'package:my_alquran/view/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SurahBloc>(create: (context) => SurahBloc()),
        BlocProvider<SurahdetailBloc>(create: (context) => SurahdetailBloc()),
        BlocProvider<AsmaulhusnaBloc>(create: (context) => AsmaulhusnaBloc()),
        BlocProvider<TimeBloc>(create: (context) => TimeBloc()),
        BlocProvider<LokasiBloc>(create: (context) => LokasiBloc()),
        BlocProvider<JadwalBloc>(create: (context) => JadwalBloc()),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
