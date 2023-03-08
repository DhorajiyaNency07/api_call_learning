import 'dart:convert';
import 'package:api_call_learning/models/character_model.dart';
import 'package:api_call_learning/screens/api_task_all.dart';
import 'package:api_call_learning/screens/character_model_map/character_model_details_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CharacterModelHomeScreen extends StatefulWidget {
  const CharacterModelHomeScreen({Key? key}) : super(key: key);

  @override
  State<CharacterModelHomeScreen> createState() =>
      _CharacterModelHomeScreenState();
}

class _CharacterModelHomeScreenState extends State<CharacterModelHomeScreen> {
  CharacterModal? characterModal;

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
        title: const Text("Character Model Api call"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ApiTaskScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
      body: characterModal == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: characterModal!.results!.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterModelDetailsPage(
                          info: characterModal!.info,
                          results: characterModal!.results![index],
                        ),
                      ),
                    );
                  },
                  tileColor: Colors.lightGreen[100],
                  leading:
                      Image.network(characterModal!.results![index].image!),
                  title: Column(
                    children: [
                      Text(characterModal!.results![index].status!),
                      // Text("result id: ${resultData!.id}"),
                      Text(
                          "species: ${characterModal!.results![index].species!}"),
                      Text("id: ${characterModal!.results![index].id!}"),
                      Text("name: ${characterModal!.results![index].name!}"),
                      Text(
                          "origin: ${characterModal!.results![index].origin!.name}"),
                      Text(
                          "origin: ${characterModal!.results![index].origin!.url}"),
                    ],
                  ),
                  subtitle: Text(
                      "loc: ${characterModal!.results![index].location!.name}"),
                  trailing: Text("pag: ${characterModal!.info!.pages!}"),
                );
              },
            ),
    );
  }


  // Get
  getPostsAPI() async {
    Client client = http.Client();
    try {
      Response response = await client
          .get(Uri.parse("https://rickandmortyapi.com/api/character"));
      if (response.statusCode == 200) {
        characterModal = CharacterModal.fromJson(jsonDecode(response.body));
        debugPrint(
            "characterModal -------------->>> ${characterModal!.toJson()}");
        debugPrint("character -------------->>> ${response.statusCode}");
        debugPrint("character -------------->>> ${response.body}");
        setState(() {});
      } else {
        debugPrint("Status Code -------------->>> ${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }

  // Send
  postPostsAPI() async {
    Client client = http.Client();
    try {
      Response response = await client.post(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "userId": 11,
          "it": 101,
          "title": "dcjhvjbdv",
          "body": "denj",
        }),
      );
      if (response.statusCode == 200) {
        debugPrint("Response -------------->>> ${jsonDecode(response.body)}");
        setState(() {});
      } else if (response.statusCode == 201) {
        debugPrint("Response -------------->>> ${jsonDecode(response.body)}");
        setState(() {});
      } else if (response.statusCode == 404) {
        debugPrint("Status Code 404-------------->>> ${response.statusCode}");
      } else {
        debugPrint("Status Code -------------->>> ${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }


  // update
  putPostsAPI() async {
    Client client = http.Client();
    try {
      Response response = await client.put(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "userId": 11,
          "it": 101,
          "title": "dcjhvjbdv",
          "body": "denj",
        }),
      );
      debugPrint("Status Code -------------->>> ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("Response -------------->>> ${jsonDecode(response.body)}");
        setState(() {});
      } else {
        debugPrint("Status Code -------------->>> ${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }


// Delete
  deletePostsAPI() async {
    Client client = http.Client();
    try {
      Response response = await client
          .delete(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      debugPrint("Status Code -------------->>> ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("Response -------------->>> ${jsonDecode(response.body)}");
      } else {
        debugPrint("Status Code -------------->>> ${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }
}
