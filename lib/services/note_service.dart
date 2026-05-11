import 'dart:async';

import '../models/note_model.dart';

/// CRUD service for notes (in-memory).
class NoteService {
  final Map<String, NoteModel> _store = {};
  final StreamController<void> _controller =
      StreamController<void>.broadcast();

  Future<void> createNote(NoteModel note) async {
    _store[note.id] = note;
    _controller.add(null);
  }

  Stream<List<NoteModel>> watchNotes(String courseId) async* {
    yield _store.values.where((n) => n.courseId == courseId).toList();
    yield* _controller.stream.map(
      (_) => _store.values.where((n) => n.courseId == courseId).toList(),
    );
  }

  /// Releases resources held by this service.
  void dispose() => _controller.close();
}
