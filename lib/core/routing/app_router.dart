import 'package:flutter/material.dart';
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
        return _createRoute(const MainView());
      case Routes.dashboardScreen:
        return _createRoute(DashboardScreen());
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
