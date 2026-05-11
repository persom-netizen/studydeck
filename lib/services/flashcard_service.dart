import 'dart:async';

import '../models/flashcard_model.dart';

/// CRUD service for flashcards (in-memory).
class FlashcardService {
  final Map<String, FlashcardModel> _store = {};
  final StreamController<void> _controller =
      StreamController<void>.broadcast();

  Future<void> createFlashcard(FlashcardModel flashcard) async {
    _store[flashcard.id] = flashcard;
    _controller.add(null);
  }

  Stream<List<FlashcardModel>> watchFlashcards(String courseId) async* {
    yield _store.values.where((f) => f.courseId == courseId).toList();
    yield* _controller.stream.map(
      (_) => _store.values.where((f) => f.courseId == courseId).toList(),
    );
  }

  /// Releases resources held by this service.
  void dispose() => _controller.close();
}
