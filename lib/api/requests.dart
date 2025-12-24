import 'dart:convert';

import 'package:http/http.dart';

final String baseUrl = 'http://127.0.0.1:8000/';

// Future<List<dynamic>> fetchAllPosts() async {
//   final response = await get(Uri.parse('$baseUrl/posts'));
//   List<dynamic> posts = jsonDecode(response.body);

//   try {
//     if (response.statusCode == 200) {
//       return posts;
//     }
//   } catch (e) {
//     print(e.toString());
//     throw 'Failed to fetch posts';
//   }
// }
