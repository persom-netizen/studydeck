import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/auth_user.dart';
import '../services/auth_service.dart';

/// Provides the auth service instance.
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

/// Auth state stream provider used to reactively drive routing.
final authStateProvider = StreamProvider<AuthUser?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges();
});

/// Notifier that manages async sign-in and sign-up operations.
class AuthNotifier extends StateNotifier<AsyncValue<void>> {
  AuthNotifier(this._authService) : super(const AsyncData(null));

  final AuthService _authService;

  /// Attempts to sign in with [email] and [password].
  ///
  /// Returns `true` on success. On failure the error is stored in [state] and
  /// `false` is returned so the caller can present feedback.
  Future<bool> signIn(String email, String password) async {
    state = const AsyncLoading();
    try {
      await _authService.signIn(email, password);
      state = const AsyncData(null);
      return true;
    } on AuthException catch (e, st) {
      state = AsyncError(e, st);
      return false;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  /// Attempts to create an account with [email] and [password].
  ///
  /// Returns `true` on success. On failure the error is stored in [state] and
  /// `false` is returned so the caller can present feedback.
  Future<bool> signUp(String email, String password) async {
    state = const AsyncLoading();
    try {
      await _authService.signUp(email, password);
      state = const AsyncData(null);
      return true;
    } on AuthException catch (e, st) {
      state = AsyncError(e, st);
      return false;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  /// Clears any stored error so the UI can reset.
  void clearError() => state = const AsyncData(null);
}

/// Exposes [AuthNotifier] to the widget tree.
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<void>>(
      (ref) => AuthNotifier(ref.watch(authServiceProvider)),
    );
