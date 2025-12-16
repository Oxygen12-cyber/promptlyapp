import 'dart:convert';

import 'package:aipromptapp/api/apimodel.dart';
import 'package:aipromptapp/components/component.dart';
import 'package:aipromptapp/extensions/extension.dart';
import 'package:aipromptapp/models/modellist.dart';
import 'package:aipromptapp/pages/postpage.dart';
import 'package:aipromptapp/pages/settingspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:http/http.dart' as http;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final String username = " User";
  final SearchController searchController = SearchController();

  final List<PostModel> allPosts = [];

  Future fetchAllPosts() async {
    final baseUrl = 'https://promptly-06c3.onrender.com/api/v1';

    final url = Uri.parse('$baseUrl/posts');

    final response = await http.get(url);
    print('contacting api');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print(data);

      List<PostModel> newdata = (data as List)
          .map((e) => PostModel.fromJson(e))
          .toList();

      setState(() {
        allPosts.addAll(newdata);
      });
    } else {
      throw 'error: $response.statusCode';
    }
  }

  @override
  void initState() {
    fetchAllPosts();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leadingWidth: 80,
        leading: IconButton.filled(
          onPressed: () {},
          style: IconButton.styleFrom(backgroundColor: Colors.blueGrey),
          iconSize: 32,
          icon: const Icon(Iconsax.profile_2user),
        ),
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome\n$username',
              style: GoogleFonts.ubuntuSans(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton.filled(
            onPressed: () {},
            iconSize: 24,

            style: IconButton.styleFrom(backgroundColor: Colors.transparent),
            icon: const Icon(Iconsax.notification_bing, color: Colors.black),
          ),
          IconButton.filled(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            style: IconButton.styleFrom(backgroundColor: Colors.transparent),
            iconSize: 24,
            icon: const Icon(Iconsax.setting, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: context.hp(2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchAnchor.bar(
              searchController: searchController,
              barHintText: 'Search anything',
              barBackgroundColor: const WidgetStatePropertyAll(Colors.white),
              dividerColor: Colors.black45,
              viewBackgroundColor: Colors.white,
              barOverlayColor: const WidgetStatePropertyAll(Colors.white),
              barHintStyle: WidgetStatePropertyAll(
                GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
              //   barElevation: WidgetStatePropertyAll(),
              barTextStyle: WidgetStatePropertyAll(
                GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              suggestionsBuilder: (context, controller) => [],
            ),
          ),
          SizedBox(height: context.hp(2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: context.hp(5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: aiLists.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: tagButton(() {}, aiLists[index]),
                ),
              ),
            ),
          ),
          SizedBox(height: context.hp(2)),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // Add your refresh logic here
                await Future.delayed(const Duration(seconds: 1));
                fetchAllPosts();
              },
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(
                  context,
                ).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: allPosts.length,
                  itemBuilder: (context, index) {
                    final post = allPosts[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: PostBox(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PostPage(
                                  postTitle: post.title,
                                  postDescription: post.description,
                                  likes: post.likes.toString(),
                                  views: post.likes.toString(),
                                  username: post.user_id.toString(),
                                  postBody: post.body,
                                  postTag: post.tag,
                                  llmModel: post.llmModel,
                                  createdDate: post.createdDate,
                                );
                              },
                            ),
                          );
                        },
                        title: post.title,
                        subtitle: post.title,
                        username: '@ ${post.user_id.toString()}',
                        post: post.body,
                        likes: post.likes.toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
