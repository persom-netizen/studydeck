import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/app_constants.dart';
import '../models/source_model.dart';

/// CRUD service for uploaded or linked sources.
class SourceService {
  SourceService({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _sources =>
      _firestore.collection(AppConstants.sourcesCollection);

  Future<void> createSource(SourceModel source) => _sources.doc(source.id).set(source.toMap());

  Stream<List<SourceModel>> watchSources(String courseId) {
    return _sources.where('courseId', isEqualTo: courseId).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => SourceModel.fromMap(doc.id, doc.data())).toList(),
        );
  }
}
