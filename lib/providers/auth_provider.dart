import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_service.dart';

/// Provides the auth service instance.
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

/// Auth state stream provider used to reactively drive routing.
final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges();
});
