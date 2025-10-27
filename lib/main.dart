import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hirely/core/data/api/api_url.dart';
import 'package:hirely/core/data/services_locator/services_locator.dart';
import 'package:hirely/core/routing/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'app_bloc_observer.dart';
import 'core/utils/app_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Validate required env vars early to fail fast and give clearer errors
  final baseUrl = ApiUrl.baseUrl;
  final anonKey = ApiUrl.supabaseAnonKey;
  if (baseUrl.isEmpty || anonKey.isEmpty) {
    // Helpful log for debugging missing .env values
    log('Missing Supabase configuration. SUPABASE_URL="$baseUrl" SUPABASE_ANON_KEY present=${anonKey.isNotEmpty}');
    throw Exception(
        'Missing SUPABASE_URL or SUPABASE_ANON_KEY in .env. Please add your Supabase project URL and anon key.');
  }

  setupServiceLocator();
  Bloc.observer = AppBlocObserver();
  await AppPreferences().init();

  await Supabase.initialize(
    url: ApiUrl.baseUrl,
    anonKey: ApiUrl.supabaseAnonKey,
  );
  log("Url: ${ApiUrl.baseUrl}");
  log("Key: ${ApiUrl.supabaseAnonKey}");
  runApp(Hirely(
    appRouter: AppRouter(),
  ));
}
