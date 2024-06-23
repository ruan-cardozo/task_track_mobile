import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_track/src/models/task.dart';

class ApiService {
  static const String baseUrl = 'http://<YOUR_API_HOST>:3000'; // Substitua pelo host da sua API

  static Future<http.Response> getTasksByStatus(String status) {
    final url = Uri.parse('$baseUrl/tasks?status=$status');
    return http.get(url);
  }

  static List<Task> parseTasks(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Task>((json) => Task.fromJson(json)).toList();
  }

  static fetchTasksByStatus(String status) {}
}

Future<List<Task>> fetchTasksByStatus(String status) async {
  final response = await ApiService.getTasksByStatus(status);

  if (response.statusCode == 200) {
    return ApiService.parseTasks(response.body);
  } else {
    throw Exception('Failed to load tasks');
  }
}
