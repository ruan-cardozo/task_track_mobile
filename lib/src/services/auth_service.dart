import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String baseUrl;

  UserService({required this.baseUrl});

  Future<http.Response> register(
      String name, String email, String password) async {
    var urlToPost = '$baseUrl/v2/users';

    try {
      var result = await http.post(
        Uri.parse(urlToPost),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );
      return result;
    } catch (e) {
      debugPrint('An error occurred: $e');

      return http.Response('An error occurred: $e', 500);
    }
  }

  Future<http.Response> login(String email, String password) async {
    var urlToPost = '$baseUrl/v2/login';

    try {
      var result = await http.post(
        Uri.parse(urlToPost),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      var decodedResult = jsonDecode(result.body);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userToken', decodedResult['access_token']);
      await prefs.setInt('userId', decodedResult['user']['sub']);
      return result;
    } catch (e) {
      debugPrint('An error occurred: $e');

      return http.Response('An error occurred: $e', 500);
    }
  }

  Future<String> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('userToken');
    if (token == null) {
      throw Exception('No token found');
    }

    return token;
  }
}
