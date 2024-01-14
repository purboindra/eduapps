import 'package:flutter/foundation.dart';

class AppPrint {
  static debugPrint(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
