import 'dart:convert';

import 'package:http/http.dart';

final String baseUrl = 'http://127.0.0.1:8000/';

Future<void> fetchAllPosts() async {
  final response = await get(Uri.parse('$baseUrl/posts'));

  try {
    if (response.statusCode == 200) {
      List<dynamic> Posts = jsonDecode(response.body);
      return jsonDecode(response.body);
    }
  } catch (e) {
    throw 'Failed to fetch posts';
  }
}
