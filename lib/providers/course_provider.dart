import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/course_model.dart';
import '../services/course_service.dart';

/// Course service provider.
final courseServiceProvider = Provider<CourseService>((ref) => CourseService());

/// Watches courses for a deck.
final coursesProvider = StreamProvider.family<List<CourseModel>, String>((ref, deckId) {
  return ref.watch(courseServiceProvider).watchCourses(deckId);
});
