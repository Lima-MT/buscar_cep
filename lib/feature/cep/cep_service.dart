import 'package:cep_app/core/dio_client.dart';
import 'package:cep_app/feature/cep/cep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class CepService {
  final Dio _dio = DioClient.instance;
  Future<CepModel?> buscarCep(String cep) async {
    try {
      final response = await _dio.get('$cep/json/');
      if (response.statusCode == 200) {
        return CepModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      debugPrint('Erro na resquisição: $e');
    }
    return null;
  }
}
