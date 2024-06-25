import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TaskService {
  final String baseUrl;

  TaskService({required this.baseUrl});

  Future<http.Response> createTask(String title, String date, String status, String description) async {
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
        body: jsonEncode({'title': title, 'date': date, 'status': status, 'description': description}),
      );
      return result;
    } catch (e) {
      debugPrint('Houve um erro ao criar a tarefa: $e');
      return http.Response('Houve um erro ao criar a tarefa: $e', 400);
    }
  }

  Future<http.Response> getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('userToken') ?? '';
    var id = prefs.getInt('userId') ?? '';
    var urlToGet = '$baseUrl/v2/users/$id';

    try {
      var result = await http.get(
        Uri.parse(urlToGet),
        headers: {
          'Content-Type': 'application/json', 
          'Authorization': 'Bearer $token'
        },
      );
      return result;
    } catch (e) {
      debugPrint('An error occurred while fetching user profile: $e');
      return http.Response('An error occurred: $e', 500);
    }
  }

  Future<http.Response> editUserProfile(String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('userToken') ?? '';
    var id = prefs.getInt('userId') ?? '';
    var urlToPut = '$baseUrl/v2/users/update/$id';

    try {
      var result = await http.put(
        Uri.parse(urlToPut),
        headers: {
          'Content-Type': 'application/json', 
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({'name': name, 'email': email}),
      );
      return result;
    } catch (e) {
      debugPrint('An error occurred while editing user profile: $e');
      return http.Response('An error occurred: $e', 500);
    }
  }
}
