import 'dart:async';

import '../models/study_deck_model.dart';

/// CRUD service for study decks (in-memory).
class StudyDeckService {
  final Map<String, StudyDeckModel> _store = {};
  final StreamController<void> _controller =
      StreamController<void>.broadcast();

  Future<void> createDeck(StudyDeckModel deck) async {
    _store[deck.id] = deck;
    _controller.add(null);
  }

  Stream<List<StudyDeckModel>> watchDecks(String userId) async* {
    yield _store.values.where((d) => d.userId == userId).toList();
    yield* _controller.stream.map(
      (_) => _store.values.where((d) => d.userId == userId).toList(),
    );
  }

  /// Releases resources held by this service.
  void dispose() => _controller.close();
}
