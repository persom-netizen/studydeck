/// Placeholder kept for compatibility; Firebase has been removed.
///
/// `FirebaseConfig.initialize()` now resolves immediately so the app
/// can boot without any cloud service dependency.
class FirebaseConfig {
  static Future<void> initialize() async {}
}
