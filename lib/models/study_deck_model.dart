/// Visibility options for a study deck.
enum DeckVisibility { private, shared, public }

/// Top-level study deck entity.
class StudyDeckModel {
  const StudyDeckModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.visibility,
    required this.isDownloadable,
  });

  final String id;
  final String userId;
  final String title;
  final String description;
  final DeckVisibility visibility;
  final bool isDownloadable;

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'title': title,
    'description': description,
    'visibility': visibility.name,
    'isDownloadable': isDownloadable,
  };

  factory StudyDeckModel.fromMap(String id, Map<String, dynamic> data) =>
      StudyDeckModel(
        id: id,
        userId: data['userId'] as String? ?? '',
        title: data['title'] as String? ?? '',
        description: data['description'] as String? ?? '',
        visibility: DeckVisibility.values.firstWhere(
          (value) => value.name == data['visibility'],
          orElse: () => DeckVisibility.private,
        ),
        isDownloadable: data['isDownloadable'] as bool? ?? false,
      );
}
