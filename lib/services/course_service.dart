import 'dart:async';

import '../models/course_model.dart';

/// CRUD service for courses (in-memory).
class CourseService {
  final Map<String, CourseModel> _store = {};
  final StreamController<void> _controller =
      StreamController<void>.broadcast();

  Future<void> createCourse(CourseModel course) async {
    _store[course.id] = course;
    _controller.add(null);
  }

  Stream<List<CourseModel>> watchCourses(String deckId) async* {
    yield _store.values.where((c) => c.deckId == deckId).toList();
    yield* _controller.stream.map(
      (_) => _store.values.where((c) => c.deckId == deckId).toList(),
    );
  }

  /// Releases resources held by this service.
  void dispose() => _controller.close();
}
