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

// post: [
//   PostsModal(
//     body: "hbnn",
//     title: "cgfcg",
//     id: 3,
//     userId: 11,
//   ),
// ],
////_________________________________________________________
// post: [PostsModal.fromJson.toString(jsonEncode(index).length)],
// post: null,
// post: PostsModal.fromJson.toString(postsList).userId,
// post: PostsModal.fromJson.toString(index).length,
// post: post(https://jsonplaceholder.typicode.com/posts),

///_______________________________________________________________

// itemBuilder: (context, index) => ListTile(
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PostDetailsPage(),
//       ),
//     );
//     setState(() {});
//   },
//   tileColor: Colors.lightGreen[100],
//   title: Column(
//     children: [
//       Text(postsList[index].title!),
//       // Text("userId: ${postsList[index].userId!}"),
//     ],
//   ),
//   // subtitle: Text("id: ${postsList[index].id}"),
//   // trailing: Text("body: ${postsList[index].body}"),
// ),

// setPostsAPI() async {
//   Client client = http.Client(); //"http.Client"--->used to make the request
//   // "try/finally" construct to ensure that the client is closed regardless of whether or not an exception is thrown.
//   try {
//     /// Sends a POST request to the specified endpoint using the client.post() method, passing in the URI, headers, and a JSON-encoded body.
//     Response response = await client.post(
//       Uri.parse("https://jsonplaceholder.typicode.com/posts"),
//
//       /// The headers parameter sets the Content-type of the request to application/json.
//       headers: {
//         'Content-type': 'application/json; charset=UTF-8',
//       },
//
//       ///The body parameter is a Map object that is converted to a JSON-encoded string using the jsonEncode() function before being sent in the request.
//       body: jsonEncode({
//         "userId": 11,
//         "it": 101,
//         "title": "dcjhvjbdv",
//         "body": "denj",
//       }),
//     );
//
//     /// The response object is returned as a http.Response object.
//     /// The function checks the status code of the response object to determine if the request was successful, and if so, it prints the response body to the console.
//     /// If the status code is not 200 or 201, an error message is printed to the console indicating the status code.
//     if (response.statusCode == 200) {
//       debugPrint("Response -------------->>> ${jsonDecode(response.body)}");
//       setState(() {});
//     } else if (response.statusCode == 201) {
//       debugPrint("Response -------------->>> ${jsonDecode(response.body)}");
//       setState(() {});
//     } else {
//       debugPrint("Status Code -------------->>> ${response.statusCode}");
//     }
//   }
//   /// Finally, the client.close() method is called in the finally block to release any system resources used by the HTTP client.
//
//    finally {
//     client.close();
//   }
// }

//// Overall, this function is a simple way to make a POST request to a remote API endpoint using Dart and the HTTP client.

///// _____________________________________________________
// onTap: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => PostDetailsPage(
//         post: PostsModal(
//           // userId:post,
//           userId: 6,
//           body: "body of postDetailPage",
//           id: 70,
//           title: "post detail page",
//         ),
//       ),
//     ),
//   );
//   setState(() {});
// },
// title: Text(postsList[index].title!),
