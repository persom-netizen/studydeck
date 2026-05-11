/// Supported source types in Study Deck.
enum SourceType { pdf, image, audio, document, link }

/// Source resource entity.
class SourceModel {
  const SourceModel({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.title,
    required this.type,
    required this.url,
  });

  final String id;
  final String userId;
  final String courseId;
  final String title;
  final SourceType type;
  final String url;

  Map<String, dynamic> toMap() => {
        'courseId': courseId,
        'userId': userId,
        'title': title,
        'type': type.name,
        'url': url,
      };

  factory SourceModel.fromMap(String id, Map<String, dynamic> data) => SourceModel(
        id: id,
        userId: data['userId'] as String? ?? '',
        courseId: data['courseId'] as String? ?? '',
        title: data['title'] as String? ?? '',
        type: SourceType.values.firstWhere(
          (value) => value.name == data['type'],
          orElse: () => SourceType.link,
        ),
        url: data['url'] as String? ?? '',
      );
}
