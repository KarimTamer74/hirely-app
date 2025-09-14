import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  // Base values from .env
  static final String baseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  static final String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  // REST API base endpoint
  static String get baseApi => "$baseUrl/rest/v1";
}
