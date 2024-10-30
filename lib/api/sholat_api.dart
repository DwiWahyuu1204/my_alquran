import 'package:dio/dio.dart';
import 'package:my_alquran/constant/constans.dart';
import 'package:my_alquran/models/sholat/get_jadwal_models.dart';
import 'package:my_alquran/models/sholat/get_lokasi_models.dart';
import 'package:my_alquran/models/sholat/get_time_models.dart';

class SholatApi {
  final Dio _dio = Dio();
  final String baseUrl = Constans().baseUrl2;
  Future<GetTimeModels> getTimeApi() async {
    try {
      final response = await _dio.get("$baseUrl/tools/time");

      if (response.statusCode == 200) {
        return GetTimeModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } on DioException {
      throw Exception('Failed to load surah list');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<GetLokasiModels> getLokasi(String keyword) async {
    try {
      final response = await _dio.get("$baseUrl/sholat/kota/cari/$keyword");

      if (response.statusCode == 200) {
        return GetLokasiModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } on DioException {
      throw Exception('Failed to load surah list');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<GetJadwalModels> getJadwalSholat(
      int idKota, int tahun, int bulan, int tanggal) async {
    try {
      final response = await _dio
          .get("$baseUrl/sholat/jadwal/$idKota/$tahun/$bulan/$tanggal");

      if (response.statusCode == 200) {
        return GetJadwalModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } on DioException {
      throw Exception('Failed to load surah list');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
