import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/study_deck_model.dart';
import '../services/study_deck_service.dart';

/// Study deck service provider.
final studyDeckServiceProvider = Provider<StudyDeckService>((ref) => StudyDeckService());

/// Watches study decks for a user.
final studyDecksProvider = StreamProvider.family<List<StudyDeckModel>, String>((ref, userId) {
  return ref.watch(studyDeckServiceProvider).watchDecks(userId);
});
