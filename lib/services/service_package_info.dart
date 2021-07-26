import 'package:package_info_plus/package_info_plus.dart';

class ServicePackageInfo {
  static PackageInfo? packageInfo;

  static Future<int?> getAppBuild() async {
    packageInfo ??= await PackageInfo.fromPlatform();
    var buildNumber = packageInfo?.buildNumber;
    if (buildNumber != null) {
      return int.tryParse(buildNumber);
    }
  }
}
