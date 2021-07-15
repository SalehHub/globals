import '../globals.dart';

final globalStateProvider = StateNotifierProvider<GlobalStateNotifier, GlobalState>((ref) => GlobalStateNotifier(GlobalState(), ref));

class GlobalStateNotifier extends StateNotifier<GlobalState> {
  GlobalStateNotifier(GlobalState state, this.ref) : super(state);

  final ProviderRefBase ref;

  void setThemeMode(BuildContext context, ThemeMode value) {
    state = state.copyWith(themeMode: value);
    ServiceTheme.setSystemUiOverlayStyle(value, context);
    ServiceGlobalCache.saveTheme(value);
  }

  void toggleThemeMode(BuildContext context) {
    if (isDark(context)) {
      setThemeMode(context, ThemeMode.light);
    } else {
      setThemeMode(context, ThemeMode.dark);
    }
  }

  void setLocale(Locale value) {
    setLocaleWithoutSaving(value);
    ServiceGlobalCache.saveLocale(value);
  }

  void setLocaleWithoutSaving(Locale value) {
    state = state.copyWith(locale: value);
  }
}
