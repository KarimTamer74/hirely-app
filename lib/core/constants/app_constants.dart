import 'package:flutter/cupertino.dart';

class AppConstants {
  static const String appName = 'My App';
  static const List<Locale> supportedLocales = [Locale('en'), Locale('ar')];
  static const String localeKey = 'app_locale';
  static const String themeKey = 'app_theme';
  static const String onBoardingKey = 'onBoardingKey';

  static const EdgeInsets appPadding = EdgeInsets.fromLTRB(20, 20, 20, 20);
  static const EdgeInsets cardPadding = EdgeInsets.all(15.0);
  static BorderRadiusGeometry cardBorderRadius = BorderRadius.circular(25);
}
