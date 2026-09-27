import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/di/app_providers.dart';
import '../../../core/constants/constants.dart';
import '../../../core/locale/app_locale.dart';

final localeNotifierProvider = NotifierProvider<LocaleNotifier, Locale>(
  LocaleNotifier.new,
);

class LocaleNotifier extends Notifier<Locale> {
  @override
  Locale build() {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final code = sharedPreferences.getString(Constants.selectedLocaleKey);
    final locale = _localeFromCode(code);
    Intl.defaultLocale = locale.languageCode;

    return locale;
  }

  Future<void> changeLocale(Locale locale) async {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    await sharedPreferences.setString(Constants.selectedLocaleKey, locale.languageCode);
    Intl.defaultLocale = locale.languageCode;
    state = locale;
  }

  Locale _localeFromCode(String? code) {
    if (code == AppLocale.english.languageCode) {
      return AppLocale.english;
    }

    return AppLocale.defaultLocale;
  }
}
