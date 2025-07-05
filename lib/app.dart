import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/features/main/presentation/pages/main_view.dart';

import 'core/constants/app_constants.dart';
import 'core/cubit/theme/theme_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

class Hirely extends StatelessWidget {
  const Hirely({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) => ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: AppConstants.appName,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: themeState.themeMode,
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  onGenerateRoute: appRouter.generateRoute,
                  initialRoute: '/',
                  home: MainView(),
                );
              },
            ));
  }
}
