import '../globals.dart';

final globalStateProvider = StateNotifierProvider<GlobalStateNotifier, GlobalState>((ref) => GlobalStateNotifier(GlobalState(), ref));

GlobalState watchGlobalState(ref) {
  return ref.watch(globalStateProvider);
}

GlobalState readGlobalState(ref) {
  return ref.watch(globalStateProvider);
}

GlobalStateNotifier readGlobalStateNotifier(ref) {
  return ref.watch(globalStateProvider.notifier);
}

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

Future<GlobalState> getGlobalState() async {
  final GlobalState globalState = GlobalState(
    locale: await ServiceGlobalCache.getLocale(),
    themeMode: await ServiceGlobalCache.getTheme(),
    os: Platform.operatingSystem.toLowerCase(),
    appBuild: await ServicePackageInfo.getAppBuild(),
    deviceModel: await ServiceDeviceInfo.getModel(),
    deviceID: await ServiceDeviceInfo.getId(),
  );
  return globalState;
}
