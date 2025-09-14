import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirely/core/common_widgets.dart/toast.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/core/data/services_locator/services_locator.dart';
import 'package:hirely/features/main/presentation/pages/main_view.dart';

import 'core/constants/app_constants.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

class Hirely extends StatelessWidget {
  const Hirely({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => sl<JobsCubit>(),
          child: MaterialApp(
            scaffoldMessengerKey: ShowToast.scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: '/',
            home: MainView(),
          ),
        );
      },
    );
  }
}
