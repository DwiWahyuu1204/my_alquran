import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_alquran/view/alquran/surah_view.dart';
import 'package:my_alquran/view/asmaulhusna/asmaulhusna_view.dart';
import 'package:my_alquran/view/sholat/sholat_view.dart';

class HomeMyalquran extends StatelessWidget {
  const HomeMyalquran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/background.jpg'), // Gambar latar belakang
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Memberikan efek blur pada gambar
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Blur efek
            child: Container(
              color:
                  Colors.black.withOpacity(0), // Transparan agar blur terlihat
            ),
          ),
          // Konten aplikasi
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيْم',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildButton(
                    context,
                    title: 'Baca Al-Quran',
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SurahView(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildButton(
                    context,
                    title: 'Asmaul Husna',
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AsmaulHusnaScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildButton(
                    context,
                    title: 'Jadwal Sholat',
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const JadwalSholatPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String title,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
