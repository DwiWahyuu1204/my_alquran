class Surah {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final Map<String, String> audioFull;

  Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
  });

  factory Surah.fromMap(Map<String, dynamic> map) {
    // Safely access map fields with default values
    Map<String, String> audioFull =
        Map<String, String>.from(map['audioFull'] ?? {});

    return Surah(
      nomor: map['nomor'] ?? 0, // Use default value if null
      nama: map['nama'] ?? '',
      namaLatin: map['namaLatin'] ?? '',
      jumlahAyat: map['jumlahAyat'] ?? 0,
      tempatTurun: map['tempatTurun'] ?? '',
      arti: map['arti'] ?? '',
      deskripsi: map['deskripsi'] ?? '',
      audioFull: audioFull,
    );
  }
}
