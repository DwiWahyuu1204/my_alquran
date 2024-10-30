import 'package:dio/dio.dart';
import 'package:my_alquran/constant/constans.dart';
import 'package:my_alquran/models/alquran/surah_detail.dart';

class SurahApi {
  final Dio _dio = Dio();
  final String baseUrl = Constans().baseUrl;

  Future<List<Map<String, dynamic>>> getSurahList() async {
    try {
      Response response = await _dio.get('$baseUrl/surat');
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> surahList =
            List<Map<String, dynamic>>.from(response.data['data']);

        return surahList;
      } else {
        throw Exception('Failed to load surah list');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<SurahDetail> getDetailSurah(int surahNumber) async {
    try {
      final response =
          await _dio.get('https://equran.id/api/v2/surat/$surahNumber');

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          return SurahDetail.fromJson(response.data);
        } else {
          throw Exception('Unexpected data format');
        }
      } else {
        throw Exception('Failed to load surah detail');
      }
    } catch (error) {
      throw Exception('Failed to load surah detail: $error');
    }
  }
}
