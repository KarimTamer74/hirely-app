import 'package:hirely/core/constants/app_constants.dart';

class ApiUrl {
  static const String baseUrl = AppConstants.supabaseUrl;

  static const String supabaseAnonKey = AppConstants.supabaseAnonKey;

  // Base API
  static const String baseApi = "$baseUrl/rest/v1";

  // Table Endpoints
  static const String applications = "$baseApi/applications";
}
