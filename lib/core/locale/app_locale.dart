import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocale {
  // Prevents instantiation and extension
  AppLocale._();

  static const Locale arabic = Locale('ar');
  static const Locale english = Locale('en');
  static const Locale defaultLocale = arabic;
  static String defaultPhoneCode = '+62';
  static const String currencyLocale = 'id_ID';
  static String defaultCurrencyCode = 'Rp';

  static const List<Locale> supportedLocales = [
    arabic,
    english,
  ];

  static const List<LocalizationsDelegate> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}
