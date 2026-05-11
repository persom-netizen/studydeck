import 'dart:async';

import '../models/auth_user.dart';

/// Simple error thrown by [AuthService] for authentication failures.
class AuthException implements Exception {
  const AuthException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => 'AuthException($code): $message';
}

class _UserRecord {
  _UserRecord({required this.userId, required this.password});
  final String userId;
  final String password;
}

/// Authentication service using in-memory storage.
///
/// Users registered in one session are available for the duration of that
/// session. No data is persisted between app restarts.
class AuthService {
  final Map<String, _UserRecord> _users = {};
  final StreamController<AuthUser?> _controller =
      StreamController<AuthUser?>.broadcast();
  AuthUser? _currentUser;

  /// Stream that emits the current user on subscription and on every change.
  Stream<AuthUser?> authStateChanges() async* {
    yield _currentUser;
    yield* _controller.stream;
  }

  /// Signs in with [email] and [password].
  ///
  /// Throws [AuthException] if credentials are invalid.
  Future<AuthUser> signIn(String email, String password) async {
    final record = _users[email.toLowerCase()];
    if (record == null || record.password != password) {
      throw const AuthException(
        'invalid-credential',
        'Incorrect email or password.',
      );
    }
    _currentUser = AuthUser(id: record.userId, email: email.toLowerCase());
    _controller.add(_currentUser);
    return _currentUser!;
  }

  /// Creates a new account with [email] and [password].
  ///
  /// Throws [AuthException] if the email is already registered.
  Future<AuthUser> signUp(String email, String password) async {
    final key = email.toLowerCase();
    if (_users.containsKey(key)) {
      throw const AuthException(
        'email-already-in-use',
        'An account already exists with this email.',
      );
    }
    final userId = key.hashCode.abs().toRadixString(16);
    _users[key] = _UserRecord(userId: userId, password: password);
    _currentUser = AuthUser(id: userId, email: key);
    _controller.add(_currentUser);
    return _currentUser!;
  }

  /// Signs out the current user.
  Future<void> signOut() async {
    _currentUser = null;
    _controller.add(null);
  }

  /// Releases resources held by this service.
  void dispose() => _controller.close();
}
