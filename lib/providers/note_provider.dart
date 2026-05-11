import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/note_model.dart';
import '../services/note_service.dart';

/// Note service provider.
final noteServiceProvider = Provider<NoteService>((ref) => NoteService());

/// Watches notes for a course.
final notesProvider = StreamProvider.family<List<NoteModel>, String>((ref, courseId) {
  return ref.watch(noteServiceProvider).watchNotes(courseId);
});
