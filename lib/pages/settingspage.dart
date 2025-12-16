import 'package:aipromptapp/api/apiservice.dart';
import 'package:flutter/material.dart';

final apiservice = ApiService();
final post = apiservice.getAllPosts();

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ListTile(
            leading: Text('post.title'),
            title: Text('nothing'),
            subtitle: Text('nothing'),
          );
        },
      ),
    );
  }
}
