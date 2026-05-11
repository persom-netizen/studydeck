import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/app_constants.dart';
import '../models/study_deck_model.dart';

/// CRUD service for study decks.
class StudyDeckService {
  StudyDeckService({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _decks =>
      _firestore.collection(AppConstants.studyDecksCollection);

  Future<void> createDeck(StudyDeckModel deck) => _decks.doc(deck.id).set(deck.toMap());

  Stream<List<StudyDeckModel>> watchDecks(String userId) {
    return _decks.where('userId', isEqualTo: userId).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => StudyDeckModel.fromMap(doc.id, doc.data())).toList(),
        );
  }
}
