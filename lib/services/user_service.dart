import 'dart:async';

import '../models/user_model.dart';

/// User profile persistence layer (in-memory).
class UserService {
  final Map<String, UserModel> _store = {};
  final StreamController<void> _controller =
      StreamController<void>.broadcast();

  Future<void> saveUser(UserModel user) async {
    _store[user.id] = user;
    _controller.add(null);
  }

  Stream<UserModel?> watchUser(String userId) async* {
    yield _store[userId];
    yield* _controller.stream.map((_) => _store[userId]);
  }

  /// Releases resources held by this service.
  void dispose() => _controller.close();
}
