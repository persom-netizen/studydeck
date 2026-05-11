import 'dart:async';

import '../models/source_model.dart';

/// CRUD service for uploaded or linked sources (in-memory).
class SourceService {
  final Map<String, SourceModel> _store = {};
  final StreamController<void> _controller =
      StreamController<void>.broadcast();

  Future<void> createSource(SourceModel source) async {
    _store[source.id] = source;
    _controller.add(null);
  }

  Stream<List<SourceModel>> watchSources(String courseId) async* {
    yield _store.values.where((s) => s.courseId == courseId).toList();
    yield* _controller.stream.map(
      (_) => _store.values.where((s) => s.courseId == courseId).toList(),
    );
  }

  /// Releases resources held by this service.
  void dispose() => _controller.close();
}
