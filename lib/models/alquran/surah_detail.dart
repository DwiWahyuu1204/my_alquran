class SurahDetail {
  final int code;
  final String message;
  final SurahDetailData data;

  SurahDetail({required this.code, required this.message, required this.data});

  factory SurahDetail.fromJson(Map<String, dynamic> json) {
    return SurahDetail(
      code: json['code'] as int? ?? 0,
      message: json['message'] as String? ?? '',
      data: SurahDetailData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class SurahDetailData {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final Map<String, String> audioFull;
  final List<Ayat> ayat;
  final Surat suratSelanjutnya;
  final Surat suratSebelumnya;

  SurahDetailData({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
    required this.ayat,
    required this.suratSelanjutnya,
    required this.suratSebelumnya,
  });

  factory SurahDetailData.fromJson(Map<String, dynamic> json) {
    return SurahDetailData(
      nomor: json['nomor'] as int? ?? 0,
      nama: json['nama'] as String? ?? '',
      namaLatin: json['namaLatin'] as String? ?? '',
      jumlahAyat: json['jumlahAyat'] as int? ?? 0,
      tempatTurun: json['tempatTurun'] as String? ?? '',
      arti: json['arti'] as String? ?? '',
      deskripsi: json['deskripsi'] as String? ?? '',
      audioFull: json['audioFull'] != null
          ? Map<String, String>.from(json['audioFull'])
          : {},
      ayat: (json['ayat'] as List<dynamic>?)
              ?.map((item) => Ayat.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      suratSelanjutnya: json['suratSelanjutnya'] != null
          ? Surat.fromJson(json['suratSelanjutnya'] as Map<String, dynamic>)
          : Surat(nomor: 0, nama: '', namaLatin: '', jumlahAyat: 0),
      suratSebelumnya: json['suratSebelumnya'] != null
          ? Surat.fromJson(json['suratSebelumnya'] as Map<String, dynamic>)
          : Surat(nomor: 0, nama: '', namaLatin: '', jumlahAyat: 0),
    );
  }
}

class Ayat {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final Map<String, String> audio;

  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomorAyat: json['nomorAyat'] as int? ?? 0,
      teksArab: json['teksArab'] as String? ?? '',
      teksLatin: json['teksLatin'] as String? ?? '',
      teksIndonesia: json['teksIndonesia'] as String? ?? '',
      audio:
          json['audio'] != null ? Map<String, String>.from(json['audio']) : {},
    );
  }
}

class Surat {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;

  Surat({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
  });

  factory Surat.fromJson(Map<String, dynamic> json) {
    return Surat(
      nomor: json['nomor'] as int? ?? 0,
      nama: json['nama'] as String? ?? '',
      namaLatin: json['namaLatin'] as String? ?? '',
      jumlahAyat: json['jumlahAyat'] as int? ?? 0,
    );
  }
}
