import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl;

  UserService({required this.baseUrl});

  Future<http.Response> register(
      String name, String email, String password) async {
    var urlToPost = '$baseUrl/v2/users';
    print(urlToPost);
    var result = await http.post(
      Uri.parse(urlToPost),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );
    print('Response status: ${result.statusCode}');
    print('Response body: ${result.body}');
    return result;
  }
}
