import 'package:logger/logger.dart';

final logger = Logger();

class AppPrint {
  static infoLog(String message) {
    logger.i(message);
  }

  static debugLog(String message) {
    logger.i(message);
  }

  static erroLog(String message) {
    logger.e("Error log", error: message);
  }
}
