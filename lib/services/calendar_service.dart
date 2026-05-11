import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/app_constants.dart';

/// Calendar sync service backed by Firestore documents.
class CalendarService {
  CalendarService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _calendars =>
      _firestore.collection(AppConstants.calendarCollection);

  Stream<List<Map<String, dynamic>>> watchCalendarEvents(String userId) {
    return _calendars
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}
