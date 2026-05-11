/// Date helpers used across Study Deck.
extension StudyDeckDateFormatting on DateTime {
  String toIsoDate() => toIso8601String().split('T').first;
}
