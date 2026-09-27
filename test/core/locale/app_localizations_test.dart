import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_pos/core/locale/app_locale.dart';
import 'package:flutter_pos/core/locale/l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('arabic and english expose different copy for the same key', () {
    final english = lookupAppLocalizations(AppLocale.english);
    final arabic = lookupAppLocalizations(AppLocale.arabic);

    expect(english.signIn, 'Sign In');
    expect(arabic.signIn, 'تسجيل الدخول');
    expect(english.language, 'Language');
    expect(arabic.language, 'اللغة');
    expect(english.online, isNot(arabic.online));
  });

  testWidgets('arabic lays out right to left and english left to right', (tester) async {
    final directions = <String, TextDirection>{};

    Future<void> pump(Locale locale) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          supportedLocales: AppLocale.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Builder(
            builder: (context) {
              directions[locale.languageCode] = Directionality.of(context);
              return Text(AppLocalizations.of(context).home);
            },
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    await pump(AppLocale.arabic);
    await pump(AppLocale.english);

    expect(directions['ar'], TextDirection.rtl);
    expect(directions['en'], TextDirection.ltr);
    expect(find.text('الرئيسية'), findsNothing);
    expect(find.text('Home'), findsOneWidget);
  });
}
