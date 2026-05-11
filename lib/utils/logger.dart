import 'dart:developer' as developer;

/// Thin logger wrapper so logging strategy can be swapped later.
class AppLogger {
  static void info(String message) => developer.log(message, name: 'StudyDeck');

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    developer.log(
      message,
      name: 'StudyDeck',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
