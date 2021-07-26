import '../globals.dart';

part 'global_state.freezed.dart';
part 'global_state.g.dart';

@freezed
class GlobalState with _$GlobalState {
  const GlobalState._();
  factory GlobalState({
    @LocaleConverter() Locale? locale,
    @ThemeModeConverter() ThemeMode? themeMode,
    String? os,
    int? appBuild,
    String? deviceID,
    String? deviceModel,
  }) = _GlobalState;
  factory GlobalState.fromJson(Map<String, dynamic> json) => _$GlobalStateFromJson(json);
}

class LocaleConverter implements JsonConverter<Locale?, String?> {
  const LocaleConverter();

  @override
  Locale? fromJson(String? json) {
    if (json == null) {
      return null;
    }
    return Locale(json);
  }

  @override
  String? toJson(Locale? data) => data?.languageCode;
}

class ThemeModeConverter implements JsonConverter<ThemeMode, String?> {
  const ThemeModeConverter();

  @override
  ThemeMode fromJson(String? json) {
    if (json == null) {
      return ThemeMode.system;
    }

    if (json == ThemeMode.light.toString()) {
      return ThemeMode.light;
    } else if (json == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  @override
  String toJson(ThemeMode data) => data.toString();
}
