/// Education level for profile branching fields.
enum EducationLevel { highSchool, college }

/// User profile stored in Firestore `users/{userId}`.
class UserModel {
  const UserModel({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
    required this.age,
    required this.educationLevel,
  });

  final String id;
  final String fullName;
  final String username;
  final String email;
  final int age;
  final EducationLevel educationLevel;

  Map<String, dynamic> toMap() => {
        'fullName': fullName,
        'username': username,
        'email': email,
        'age': age,
        'educationLevel': educationLevel.name,
      };

  factory UserModel.fromMap(String id, Map<String, dynamic> data) => UserModel(
        id: id,
        fullName: data['fullName'] as String? ?? '',
        username: data['username'] as String? ?? '',
        email: data['email'] as String? ?? '',
        age: (data['age'] as num?)?.toInt() ?? 0,
        educationLevel: (data['educationLevel'] as String?) == EducationLevel.college.name
            ? EducationLevel.college
            : EducationLevel.highSchool,
      );
}
