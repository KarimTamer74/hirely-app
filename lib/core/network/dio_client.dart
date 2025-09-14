import 'package:dio/dio.dart';
import 'package:hirely/core/data/api/api_url.dart';

Dio createDioClient() {
  final dio = Dio();

  dio.options.headers = {
    'apikey': ApiUrl.supabaseAnonKey,
    'Authorization': 'Bearer ${ApiUrl.supabaseAnonKey}',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  return dio;
}
