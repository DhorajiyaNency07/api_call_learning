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
        title: Text(
          "${post!.title}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${post!.title}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("${post!.body}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Text('User ID: ${post!.userId}',
                style: const TextStyle(fontSize: 18)),
            Text('Post ID: ${post!.id}', style: const TextStyle(fontSize: 18)),
            Text('Body: ${post!.body}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
