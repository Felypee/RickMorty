import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio();

  static Dio get dio => _dio;

  static void configure(String baseUrl) {
    _dio.options.headers['Content-Type'] = "application/json";
    _dio.options.baseUrl = baseUrl;
  }

  static void updateAuthToken(String newAuthToken) {
    _dio.options.headers['Authorization'] = newAuthToken;
  }
}
