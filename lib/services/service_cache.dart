import '../globals.dart';

class ServiceGlobalCache {
  static const _langKey = 'langKey';
  static const _themeKey = 'themeKey';
  static SharedPreferences? _sharedPreferences;

  static Future<String?> get(String key) async {
    return (await getSharedPreferences()).getString(key);
  }

  static Future<void> save(String data, String key) async {
    await (await getSharedPreferences()).setString(key, data);
  }

  static Future<SharedPreferences> getSharedPreferences() async {
    return _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> saveLocale(Locale data) async {
    await save(data.languageCode, _langKey);
  }

  static Future<Locale> getLocale() async {
    //check if the user has stored a language before
    final String? storeLang = await get(_langKey);
    if (storeLang != null) {
      final bool isSupported = ServiceLocale.supportedLocales.where((e) => e.languageCode == storeLang).isNotEmpty;
      if (isSupported) {
        return Locale(storeLang);
      }
    }
    //or return the device or default locale
    return ServiceLocale.deviceLocale();
  }

  static Future<void> saveTheme(ThemeMode data) async {
    await save(data.toString(), _themeKey);
  }

  static Future<ThemeMode> getTheme() async {
    final String? data = await get(_themeKey);
    if (data != null) {
      if (data == ThemeMode.dark.toString()) {
        return ThemeMode.dark;
      } else if (data == ThemeMode.light.toString()) {
        return ThemeMode.light;
      }
    }

    return ThemeMode.system;
  }
}
