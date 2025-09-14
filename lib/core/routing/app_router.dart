import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hirely/core/cubit/job_cubit/jobs_cubit.dart';
import 'package:hirely/core/data/repo/repo_impl.dart';
import 'package:hirely/core/data/services_locator/services_locator.dart';
import 'package:hirely/features/add_application/presentation/pages/add_application_screen.dart';
import 'package:hirely/features/add_application/presentation/widgets/add_application_second_page.dart';
import 'package:hirely/features/applications/presentation/pages/applications_screen.dart';
import 'package:hirely/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:hirely/features/main/presentation/pages/main_view.dart';

import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../routing/routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return _createRoute(const SplashScreen());
      case Routes.onBoardingScreen:
        return _createRoute(const OnboardingScreen());
      case Routes.mainView:
        int? index = settings.arguments as int?;
        if (index != null) {
          return _createRoute(
            MainView(
              initialIndex: index,
            ),
          );
        }
        return _createRoute(const MainView());
      case Routes.dashboardScreen:
        return _createRoute(DashboardScreen());
      case Routes.applicationsScreen:
        return _createRoute(ApplicationsScreen());
      case Routes.addApplicationScreen:
        return _createRoute(AddApplicationScreen());
      case Routes.addApplicationSecondScreen:
        return _createRoute(BlocProvider(
          create: (context) => JobsCubit(sl<RepoImplementation>()),
          child: AddApplicationSecondPage(),
        ));
      default:
        return null;
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
