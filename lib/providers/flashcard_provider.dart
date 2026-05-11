import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/flashcard_model.dart';
import '../services/flashcard_service.dart';

/// Flashcard service provider.
final flashcardServiceProvider = Provider<FlashcardService>(
  (ref) => FlashcardService(),
);

/// Watches flashcards for a course.
final flashcardsProvider = StreamProvider.family<List<FlashcardModel>, String>((
  ref,
  courseId,
) {
  return ref.watch(flashcardServiceProvider).watchFlashcards(courseId);
});
