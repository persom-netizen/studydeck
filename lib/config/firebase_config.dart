import 'package:firebase_core/firebase_core.dart';

/// Firebase bootstrap helper.
///
/// This keeps initialization in one place so environment-specific config can be
/// added later (for example, generated options from FlutterFire CLI).
class FirebaseConfig {
  static Future<FirebaseApp> initialize() {
    return Firebase.initializeApp();
  }
}
