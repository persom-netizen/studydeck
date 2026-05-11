import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

/// User service provider.
final userServiceProvider = Provider<UserService>((ref) => UserService());

/// Watches a user profile document.
final userProvider = StreamProvider.family<UserModel?, String>((ref, userId) {
  return ref.watch(userServiceProvider).watchUser(userId);
});
