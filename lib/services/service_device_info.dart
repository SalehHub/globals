import '../globals.dart';

class ServiceDeviceInfo {
  static DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  static AndroidDeviceInfo? androidInfo;
  static IosDeviceInfo? iosInfo;

  static Future<String?> getId() async {
    if (Platform.isAndroid) {
      androidInfo ??= await deviceInfo.androidInfo;
      return androidInfo?.id;
    } else if (Platform.isIOS) {
      iosInfo ??= await deviceInfo.iosInfo;
      return iosInfo?.identifierForVendor;
    }
  }

  static Future<String?> getModel() async {
    if (Platform.isAndroid) {
      androidInfo ??= await deviceInfo.androidInfo;
      return androidInfo?.model;
    } else if (Platform.isIOS) {
      iosInfo ??= await deviceInfo.iosInfo;
      return iosInfo?.model;
    }
  }
}
