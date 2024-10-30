import 'package:dio/dio.dart';
import 'package:my_alquran/constant/constans.dart';
import 'package:my_alquran/models/asmaulhusna/asmaulhusna_models.dart';

class AsmaulhusnaApi {
  final Dio _dio = Dio();
  final String baseUrl = Constans().baseUrl2;
  Future<AsmaulhusnaModels> getAsmaulHusna() async {
    try {
      final response = await _dio.get('$baseUrl/husna/semua');

      if (response.statusCode == 200) {
        return AsmaulhusnaModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }
}
