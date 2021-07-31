import 'package:path_provider/path_provider.dart';

class Helpers {
  static String? path;

  Future<String> getAppDocumentsDirectoryPath({String? filename}) async {
    if (path == null) {
      path = (await getApplicationDocumentsDirectory()).path;
      print(path);
    }

    if (filename != null) {
      return "$path/$filename";
    }

    return path!;
  }
}
