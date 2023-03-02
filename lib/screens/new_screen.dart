import 'package:api_call_learning/model/post_model.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatelessWidget {
  final PostsModal? post;

  const PostDetailsPage({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${post!.title}", style: const TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${post!.title}", style: const TextStyle(fontSize: 18,fontWeight:FontWeight.bold)),
            Text("${post!.body}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Text('User ID: ${post!.userId}', style: const TextStyle(fontSize: 18)),
            Text('Post ID: ${post!.id}', style: const TextStyle(fontSize: 18)),
            Text('Body: ${post!.body}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
// import 'model/post_model.dart';
//
// class NewScreen extends StatefulWidget {
//   const NewScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NewScreen> createState() => _NewScreenState();
// }
//
// class _NewScreenState extends State<NewScreen> {
//   List<PostsModal> newScreenData = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("New Screen"),
//       ),
//       body: Center(
//         child: ListView.separated(
//           itemCount: newScreenData.length,
//           separatorBuilder: (context, index) => const SizedBox(height: 15),
//           itemBuilder: (context, index) => ListTile(
//             tileColor: Colors.lightGreen[100],
//             title: Column(
//               children: [
//                 Text("userId: ${newScreenData[index].userId!}"),
//               ],
//             ),
//             subtitle: Text("id: ${newScreenData[index].id}"),
//             trailing: Text("body: ${newScreenData[index].body}"),
//           ),
//         ),
//       ),
//     );
//   }
//
//   getPostsAPI() async {
//     Client client = http.Client();
//     try {
//       Response response = await client
//           // .get(Uri.parse("https://rickandmortyapi.com/api/character"));
//           .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
//       if (response.statusCode == 200) {
//         newScreenData = (jsonDecode(response.body) as List?)!
//             .map((dynamic e) => PostsModal.fromJson(e))
//             .toList();
//         debugPrint(
//             "PostsModal statusCode-------------->>> ${response.statusCode}");
//         debugPrint("PostsModal body-------------->>> ${response.body}");
//         setState(() {});
//       } else {
//         debugPrint("Status Code -------------->>> ${response.statusCode}");
//       }
//     } finally {
//       client.close();
//     }
//   }
// }
