import 'dart:convert';
import 'package:http/http.dart' as http;

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
      print('An error occurred: $e');

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

      return result;
    } catch (e) {
      print('An error occurred: $e');

      return http.Response('An error occurred: $e', 500);
    }
  }
}
