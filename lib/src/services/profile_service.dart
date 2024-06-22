
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  final String baseUrl;

  ProfileService({required this.baseUrl});

  Future<http.Response> updateProfile(
      String name, String email, String password) async {
    var urlToPost = '$baseUrl/v2/users';

    try {
      var result = await http.put(
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

  Future<http.Response> getUserProfile() async {
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
      debugPrint('An error occurred: $e');

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
        body: jsonEncode({
          'name': name,
          'email': email,
        }),
      );
      
      return result;
    } catch (e) {
      debugPrint('An error occurred: $e');

      return http.Response('An error occurred: $e', 500);
    }
  }
}