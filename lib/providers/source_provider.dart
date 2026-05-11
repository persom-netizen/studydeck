import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/source_model.dart';
import '../services/source_service.dart';

/// Source service provider.
final sourceServiceProvider = Provider<SourceService>((ref) => SourceService());

/// Watches sources for a course.
final sourcesProvider = StreamProvider.family<List<SourceModel>, String>((ref, courseId) {
  return ref.watch(sourceServiceProvider).watchSources(courseId);
});
