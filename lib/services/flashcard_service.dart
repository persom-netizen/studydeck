import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/app_constants.dart';
import '../models/flashcard_model.dart';

/// CRUD service for flashcards.
class FlashcardService {
  FlashcardService({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _flashcards =>
      _firestore.collection(AppConstants.flashcardsCollection);

  Future<void> createFlashcard(FlashcardModel flashcard) =>
      _flashcards.doc(flashcard.id).set(flashcard.toMap());

  Stream<List<FlashcardModel>> watchFlashcards(String courseId) {
    return _flashcards.where('courseId', isEqualTo: courseId).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => FlashcardModel.fromMap(doc.id, doc.data())).toList(),
        );
  }
}
