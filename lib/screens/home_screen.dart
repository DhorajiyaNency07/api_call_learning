import 'dart:convert';
import 'package:api_call_learning/model/post_model.dart';
import 'package:api_call_learning/screens/character_model_home_screen.dart';
import 'package:api_call_learning/screens/new_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModal> postsList = [];

  @override
  void initState() {
    // TODO: implement initState
    getPostsAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PostPage Api calling"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CharacterModelHomeScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
      body: postsList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: postsList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final post = postsList[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailsPage(post: post),
                      ),
                    );
                    setState(() {});
                  },
                  tileColor: Colors.lightGreen[100],
                  title: Text("title: ${post.title}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text('User ID: ${post.userId}'),
                );
              },
            ),
    );
  }

  getPostsAPI() async {
    Client client = http.Client();
    try {
      Response response = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        postsList = (jsonDecode(response.body) as List?)!
            .map((dynamic e) => PostsModal.fromJson(e))
            .toList();
        debugPrint(
            "PostsModal statusCode-------------->>> ${response.statusCode}");
        debugPrint("PostsModal body-------------->>> ${response.body}");
        setState(() {});
      } else {
        debugPrint("Status Code -------------->>> ${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }
}
