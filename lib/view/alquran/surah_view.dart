import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_alquran/view/alquran/detail_surah.dart';
import 'package:my_alquran/view/alquran/surah_bloc/surah_bloc.dart';

class SurahView extends StatefulWidget {
  const SurahView({super.key});

  @override
  State<SurahView> createState() => _SurahViewState();
}

class _SurahViewState extends State<SurahView> {
  late SurahBloc listSurahBloc;
  late AudioPlayer _audioPlayer;
  int? _playingIndex;

  @override
  void initState() {
    super.initState();

    listSurahBloc = BlocProvider.of<SurahBloc>(context);
    listSurahBloc.add(GetAllSurah());
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio(String url, int index) async {
    try {
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _playingIndex = index;
      });
    } catch (e) {
      const Text("Audio Tidak DiTemukan");
    }
  }

  void _pauseAudio() {
    _audioPlayer.pause();
    setState(() {
      _playingIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87, // Background Scaffold (Dark Mode)
      body: BlocBuilder<SurahBloc, SurahState>(
        builder: (context, state) {
          if (state is SurahInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SurahLoaded) {
            return ListView.builder(
              itemCount: state.surahs.length,
              itemBuilder: (context, index) {
                final surah = state.surahs[index];
                final isPlaying = _playingIndex == index;

                return ListTile(
                  title: Row(
                    children: [
                      // Menampilkan nomor surah
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color:
                              Colors.teal, // Warna background untuk nomor surah
                          borderRadius:
                              BorderRadius.circular(15), // Bentuk bulat
                        ),
                        child: Center(
                          child: Text(
                            surah.nomor.toString(),
                            style: const TextStyle(
                              color: Colors.white, // Warna nomor surah
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Menampilkan nama surah
                      Expanded(
                        child: Text(
                          surah.nama,
                          style: const TextStyle(
                            color: Colors
                                .white, // Teks warna putih untuk dark mode
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    surah.namaLatin,
                    style: const TextStyle(
                      color: Colors
                          .white70, // Subtitle dengan warna abu-abu terang
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white, // Ikon warna putih
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        _pauseAudio();
                      } else {
                        final audioUrl = surah.audioFull['05'];
                        if (audioUrl != null && audioUrl.isNotEmpty) {
                          _playAudio(audioUrl, index);
                        } else {
                          const Text("Audio Tidak DiTemukan");
                        }
                      }
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailSurahScreen(
                          surahNumber: surah.nomor,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is SurahError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }
}
