/// Course entity connected to a study deck.
class CourseModel {
  const CourseModel({
    required this.id,
    required this.userId,
    required this.deckId,
    required this.courseName,
    required this.instructor,
    required this.code,
  });

  final String id;
  final String userId;
  final String deckId;
  final String courseName;
  final String instructor;
  final String code;

  Map<String, dynamic> toMap() => {
    'deckId': deckId,
    'userId': userId,
    'courseName': courseName,
    'instructor': instructor,
    'code': code,
  };

  factory CourseModel.fromMap(String id, Map<String, dynamic> data) =>
      CourseModel(
        id: id,
        userId: data['userId'] as String? ?? '',
        deckId: data['deckId'] as String? ?? '',
        courseName: data['courseName'] as String? ?? '',
        instructor: data['instructor'] as String? ?? '',
        code: data['code'] as String? ?? '',
      );
}
