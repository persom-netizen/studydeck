import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/app_constants.dart';
import '../models/note_model.dart';

/// CRUD service for notes.
class NoteService {
  NoteService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _notes =>
      _firestore.collection(AppConstants.notesCollection);

  Future<void> createNote(NoteModel note) =>
      _notes.doc(note.id).set(note.toMap());

  Stream<List<NoteModel>> watchNotes(String courseId) {
    return _notes
        .where('courseId', isEqualTo: courseId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => NoteModel.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }
}
