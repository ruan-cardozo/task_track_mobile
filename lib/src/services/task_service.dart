import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_track/src/models/task.dart';

class TaskService {
  final String baseUrl;
  final List<Task> tasks;

  TaskService({required this.baseUrl, required this.tasks});

  Future<http.Response> createTask(
      String title, String date, String status, String description) async {
    var urlToPost = '$baseUrl/v2/tasks';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('userToken') ?? '';
    try {
      var result = await http.post(
        Uri.parse(urlToPost),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          'title': title,
          'dueDate': date,
          'status': status,
          'description': description,
        }),
      );

      print(result.body);
      return result;
    } catch (e) {
      debugPrint('Houve um erro ao criar a tarefa: $e');
      return http.Response('Houve um erro ao criar a tarefa: $e', 400);
    }
  }

  Future<List<Task>> getTasks(status) async {
    var statusToFilter = status;

    switch (status) {
      case 'A fazer':
        statusToFilter = 'todo';
        break;
      case 'Em progresso':
        statusToFilter = 'doing';
        break;
      case 'Concluído':
        statusToFilter = 'done';
        break;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('userToken') ?? '';
    var urlToGet = '$baseUrl/v2/tasks/status/$statusToFilter';

    try {
      var response = await http.get(
        Uri.parse(urlToGet),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> tasksJson = json.decode(response.body);
        List<Task> tasks =
            tasksJson.map((json) => Task.fromJson(json)).toList();

        print(tasks);
        return tasks;
      } else {
        print('Server error: ${response.body}');
        return [];
      }
    } catch (e) {
      print('An error occurred while fetching tasks: $e');
      return [];
    }
  }

  Future<http.Response> editTask(
      String title, String date, String status, String description, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('userToken') ?? '';
    var urlToPut = '$baseUrl/v2/tasks/$id';
    try {
      var result = await http.put(
        Uri.parse(urlToPut),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'title': title,
          'dueDate': date,
          'status': status,
          'description': description,
        }),
      );
      return result;
    } catch (e) {
      debugPrint('An error occurred while editing the task: $e');
      return http.Response('An error occurred: $e', 400);
    }
  }
}
