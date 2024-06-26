class Task {
  final int id;
  final String title;
  final String description;
  final bool completed;
  final String status;
  final DateTime dueDate;

  Task({
    required this.id,
    required this.description,
    required this.title,
    required this.completed,
    required this.status,

    required this.dueDate,
  });

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      completed: json['completed'],
      status: json['status'],
      dueDate: DateTime.parse(json['dueDate']),
    );
  }
}