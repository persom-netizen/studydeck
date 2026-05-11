import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/app_constants.dart';
import '../models/user_model.dart';

/// User profile persistence layer.
class UserService {
  UserService({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection(AppConstants.usersCollection);

  Future<void> saveUser(UserModel user) => _users.doc(user.id).set(user.toMap(), SetOptions(merge: true));

  Stream<UserModel?> watchUser(String userId) {
    return _users.doc(userId).snapshots().map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return UserModel.fromMap(doc.id, doc.data()!);
    });
  }
}
