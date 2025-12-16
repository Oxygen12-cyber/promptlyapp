import 'dart:convert';

import 'apimodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String? token;
  static const baseUrl = 'http://127.0.0.1:8000/api/v1';

  ApiService({this.token});

  Map<String, String> get getHeaders {
    final Map<String, String> headers = {'content-type': 'application/json'};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  // Authentication funcions
  Future<void> registerUser(
    String email,
    String username,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/auth/register');

    final response = await http.post(
      url,
      headers: getHeaders,
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw 'error: $response.statusCode';
    }
  }

  Future<void> loginUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');

    final response = await http.post(
      url,
      headers: {},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      throw 'error: $response.statusCode';
    }
  }

  // User based functions
  Future<void> getCurrentUser() async {
    final url = Uri.parse('$baseUrl/users/me');

    final response = await http.get(url, headers: getHeaders);

    if (response.statusCode == 200) {}
  }

  // Post functions
  Future<List<PostModel>> getAllPosts()async{
    final url = Uri.parse('$baseUrl/posts');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<PostModel> data = jsonDecode(response.body);
      return data;
    } else{
      throw 'error: $response.statusCode';
    }
  }
  // Likes functions
}
