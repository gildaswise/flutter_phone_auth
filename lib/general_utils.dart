import 'package:meta/meta.dart' show required;

class Utils {
  static void log(String tag, {@required String message}) {
      assert(tag != null);
      print("[$tag] $message");
  }
}
