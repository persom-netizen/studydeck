import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/app_constants.dart';
import '../models/course_model.dart';

/// CRUD service for courses.
class CourseService {
  CourseService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _courses =>
      _firestore.collection(AppConstants.coursesCollection);

  Future<void> createCourse(CourseModel course) =>
      _courses.doc(course.id).set(course.toMap());

  Stream<List<CourseModel>> watchCourses(String deckId) {
    return _courses
        .where('deckId', isEqualTo: deckId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => CourseModel.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }
}
