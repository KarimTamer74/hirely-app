import 'package:dio/dio.dart';
import 'package:hirely/core/constants/app_constants.dart';

Dio createDioClient() {
  final dio = Dio();

  dio.options.headers = {
    'apikey': AppConstants.supabaseAnonKey,
    'Authorization': 'Bearer ${AppConstants.supabaseAnonKey}',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  return dio;
}
