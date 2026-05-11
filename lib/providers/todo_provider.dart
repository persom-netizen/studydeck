import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo_model.dart';
import '../services/todo_service.dart';

/// To-do service provider.
final todoServiceProvider = Provider<TodoService>((ref) => TodoService());

/// Watches todos for a user.
final todosProvider = StreamProvider.family<List<TodoModel>, String>((ref, userId) {
  return ref.watch(todoServiceProvider).watchTodos(userId);
});
