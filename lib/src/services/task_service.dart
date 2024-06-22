import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Task>> fetchTasksByStatus(String status) async {
  final response = await http.get(Uri.parse('https://suaapi.com/tasks?status=$status'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((task) => Task.fromJson(task)).toList();
  } else {
    throw Exception('Failed to load tasks');
  }
}

class Task {
  final int id;
  final String title;
  final String status;

  Task({required this.id, required this.title, required this.status});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      status: json['status'],
    );
  }
}
