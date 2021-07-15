import '../globals.dart';

class ServiceNav {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> push({required Widget page}) async {
    await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
