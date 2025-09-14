import 'package:flutter/cupertino.dart';

class AppConstants {
  static const String appName = 'My App';
  static const List<Locale> supportedLocales = [Locale('en'), Locale('ar')];
  static const String localeKey = 'app_locale';
  static const String themeKey = 'app_theme';
  static const EdgeInsets appPadding = EdgeInsets.fromLTRB(20, 20, 20, 20);
  static const EdgeInsets cardPadding = EdgeInsets.all(15.0);
  static BorderRadiusGeometry cardBorderRadius = BorderRadius.circular(25);
  static const String supabaseUrl = 'https://amgehhlufpvyfhjatdad.supabase.co';
  static const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFtZ2VoaGx1ZnB2eWZoamF0ZGFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTczNTI1NzEsImV4cCI6MjA3MjkyODU3MX0.oL2auo2GwyAKFQ9u3z2iPafQQvnWysoBc1ZSl_4LDuI';
}
