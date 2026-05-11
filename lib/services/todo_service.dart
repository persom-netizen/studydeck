import 'dart:async';

import '../models/todo_model.dart';

/// CRUD service for user to-do tasks (in-memory).
class TodoService {
  final Map<String, TodoModel> _store = {};
  final StreamController<void> _controller =
      StreamController<void>.broadcast();

  Future<void> createTodo(TodoModel todo) async {
    _store[todo.id] = todo;
    _controller.add(null);
  }

  Stream<List<TodoModel>> watchTodos(String userId) async* {
    yield _store.values.where((t) => t.userId == userId).toList();
    yield* _controller.stream.map(
      (_) => _store.values.where((t) => t.userId == userId).toList(),
    );
  }

  /// Releases resources held by this service.
  void dispose() => _controller.close();
}
