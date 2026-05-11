import 'dart:async';

/// Calendar sync service (in-memory).
class CalendarService {
  final List<Map<String, dynamic>> _store = [];
  final StreamController<void> _controller =
      StreamController<void>.broadcast();

  Stream<List<Map<String, dynamic>>> watchCalendarEvents(
    String userId,
  ) async* {
    yield _store.where((e) => e['userId'] == userId).toList();
    yield* _controller.stream.map(
      (_) => _store.where((e) => e['userId'] == userId).toList(),
    );
  }

  /// Releases resources held by this service.
  void dispose() => _controller.close();
}
