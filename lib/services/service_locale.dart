import '../globals.dart';

class ServiceLocale {
  static Locale defaultLocale = const Locale('ar');
  static List<Locale> supportedLocales = [
    defaultLocale,
  ];

  static List<LocalizationsDelegate<Object>> localizationsDelegates([List others = const []]) => [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ...others,
      ];

  // static List<Locale> supportedLocales([List<Locale> others = const []]) => [
  //       defaultLocale,
  //       ...others,
  //     ];

  static Future<Locale> deviceLocale() async {
    //check if device locale is supported
    final Locale? deviceLocaleLanguageCode = WidgetsBinding.instance?.window.locale;
    if (deviceLocaleLanguageCode != null) {
      final bool isSupported = supportedLocales.where((e) => e.languageCode == deviceLocaleLanguageCode.languageCode).isNotEmpty;
      if (isSupported) {
        return deviceLocaleLanguageCode;
      }
    }

    //or return th default language
    return defaultLocale;
  }

  // static String deviceLocaleLangCode() async => await deviceLocale().languageCode;
  static bool isArabicLocale(BuildContext context) => Localizations.localeOf(context).languageCode == 'ar';
}
