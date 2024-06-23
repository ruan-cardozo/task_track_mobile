class Task {
  final int id;
  final String description;
  final bool completed;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime dueDate;

  Task({
    required this.id,
    required this.description,
    required this.completed,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.dueDate,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      description: json['description'],
      completed: json['completed'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      dueDate: DateTime.parse(json['due_date']),
    );
  }
}