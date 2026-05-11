/// Priority levels for to-do items.
enum TodoPriority { low, medium, high }

/// To-do task model.
class TodoModel {
  const TodoModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.priority,
    this.completed = false,
  });

  final String id;
  final String userId;
  final String title;
  final TodoPriority priority;
  final bool completed;

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'title': title,
        'priority': priority.name,
        'completed': completed,
      };

  factory TodoModel.fromMap(String id, Map<String, dynamic> data) => TodoModel(
        id: id,
        userId: data['userId'] as String? ?? '',
        title: data['title'] as String? ?? '',
        priority: TodoPriority.values.firstWhere(
          (value) => value.name == data['priority'],
          orElse: () => TodoPriority.medium,
        ),
        completed: data['completed'] as bool? ?? false,
      );
}
