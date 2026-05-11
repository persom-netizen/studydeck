import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../utils/logger.dart';

/// Firebase bootstrap helper.
///
/// This keeps initialization in one place so environment-specific config can be
/// added later (for example, generated options from FlutterFire CLI).
class FirebaseConfig {
  static final FirebaseOptions _webOptions = _buildWebOptionsFromEnvironment();

  static Future<FirebaseApp> initialize() async {
    try {
      if (kIsWeb) {
        return Firebase.initializeApp(options: _webOptions);
      }
      return Firebase.initializeApp();
    } on FirebaseException catch (error, stackTrace) {
      AppLogger.error(
        'Firebase initialization failed with code "${error.code}": ${error.message}',
        error,
        stackTrace,
      );
      rethrow;
    } catch (error, stackTrace) {
      AppLogger.error('Failed to initialize Firebase', error, stackTrace);
      rethrow;
    }
  }

  static FirebaseOptions _buildWebOptionsFromEnvironment() {
    const apiKey = String.fromEnvironment('FIREBASE_API_KEY');
    const appId = String.fromEnvironment('FIREBASE_APP_ID');
    const messagingSenderId = String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');
    const projectId = String.fromEnvironment('FIREBASE_PROJECT_ID');
    const authDomain = String.fromEnvironment('FIREBASE_AUTH_DOMAIN');
    const storageBucket = String.fromEnvironment('FIREBASE_STORAGE_BUCKET');
    const measurementId = String.fromEnvironment('FIREBASE_MEASUREMENT_ID');

    final missingKeys = <String>[
      if (apiKey.isEmpty) 'FIREBASE_API_KEY',
      if (appId.isEmpty) 'FIREBASE_APP_ID',
      if (messagingSenderId.isEmpty) 'FIREBASE_MESSAGING_SENDER_ID',
      if (projectId.isEmpty) 'FIREBASE_PROJECT_ID',
    ];

    if (missingKeys.isNotEmpty) {
      throw FirebaseException(
        plugin: 'firebase_core',
        code: 'missing-web-config',
        message: 'Missing required Firebase web configuration values: ${missingKeys.join(', ')}',
      );
    }

    return FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
      authDomain: authDomain.isEmpty ? null : authDomain,
      storageBucket: storageBucket.isEmpty ? null : storageBucket,
      measurementId: measurementId.isEmpty ? null : measurementId,
    );
  }
}
