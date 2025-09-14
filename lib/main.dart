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

  setupServiceLocator();
  Bloc.observer = AppBlocObserver();
  await AppPreferences().init();

  await Supabase.initialize(
    url: ApiUrl.baseUrl,
    anonKey: ApiUrl.supabaseAnonKey,
  );
  runApp(Hirely(
    appRouter: AppRouter(),
  ));
}
