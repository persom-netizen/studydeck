/// Difficulty used by spaced repetition metadata.
enum FlashcardDifficulty { easy, medium, hard }

/// Flashcard entity for studying.
class FlashcardModel {
  const FlashcardModel({
    required this.id,
    required this.userId,
    required this.courseId,
    required this.front,
    required this.back,
    required this.difficulty,
  });

  final String id;
  final String userId;
  final String courseId;
  final String front;
  final String back;
  final FlashcardDifficulty difficulty;

  Map<String, dynamic> toMap() => {
    'courseId': courseId,
    'userId': userId,
    'front': front,
    'back': back,
    'difficulty': difficulty.name,
  };

  factory FlashcardModel.fromMap(String id, Map<String, dynamic> data) =>
      FlashcardModel(
        id: id,
        userId: data['userId'] as String? ?? '',
        courseId: data['courseId'] as String? ?? '',
        front: data['front'] as String? ?? '',
        back: data['back'] as String? ?? '',
        difficulty: FlashcardDifficulty.values.firstWhere(
          (value) => value.name == data['difficulty'],
          orElse: () => FlashcardDifficulty.medium,
        ),
      );
}
