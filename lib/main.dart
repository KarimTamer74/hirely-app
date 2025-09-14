import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hirely/core/data/services_locator/services_locator.dart';
import 'package:hirely/core/routing/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'app_bloc_observer.dart';
import 'core/constants/app_constants.dart';
import 'core/utils/app_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = AppBlocObserver();
  await AppPreferences().init();

  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );
  runApp(Hirely(
    appRouter: AppRouter(),
  ));
}
