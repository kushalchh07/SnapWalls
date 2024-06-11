import 'package:dio/dio.dart';

class API {
  Dio _dio = Dio();

  API() {
    _dio.options.baseUrl = "https://api.pexels.com/v1/curated?per_page=80";

    _dio.options.headers['Authorization'] =
        'ub1jVSB2BzOMVBpEnRCObkK3sE7YQ7tDvWNxxy1Wb5uSjgCPdVi3GwK2 ';
  }
  Dio get sendRequest => _dio;
}
