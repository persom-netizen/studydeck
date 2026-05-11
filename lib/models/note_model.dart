/// Notes attached to a course.
class NoteModel {
  const NoteModel({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.title,
    required this.body,
    this.pinned = false,
  });

  final String id;
  final String userId;
  final String courseId;
  final String title;
  final String body;
  final bool pinned;

  Map<String, dynamic> toMap() => {
        'courseId': courseId,
        'userId': userId,
        'title': title,
        'body': body,
        'pinned': pinned,
      };

  factory NoteModel.fromMap(String id, Map<String, dynamic> data) => NoteModel(
        id: id,
        userId: data['userId'] as String? ?? '',
        courseId: data['courseId'] as String? ?? '',
        title: data['title'] as String? ?? '',
        body: data['body'] as String? ?? '',
        pinned: data['pinned'] as bool? ?? false,
      );
}
