import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/app_constants.dart';
import '../models/todo_model.dart';

/// CRUD service for user to-do tasks.
class TodoService {
  TodoService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _todos =>
      _firestore.collection(AppConstants.todosCollection);

  Future<void> createTodo(TodoModel todo) =>
      _todos.doc(todo.id).set(todo.toMap());

  Stream<List<TodoModel>> watchTodos(String userId) {
    return _todos
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TodoModel.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }
}
