/// PostServices all function
//
// import 'dart:convert';
// import 'package:api_call_learning/model/character_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
// class PostService {
//   CharacterModal? characterModal;
//
//   getPostsAPI() async {
//     Client client = http.Client();
//     try {
//       Response response = await client
//           .get(Uri.parse("https://rickandmortyapi.com/api/character"));
//       if (response.statusCode == 200) {
//         characterModal = CharacterModal.fromJson(jsonDecode(response.body));
//         debugPrint(
//             "characterModal -------------->>> ${characterModal!.toJson()}");
//         debugPrint("character -------------->>> ${response.statusCode}");
//         debugPrint("character -------------->>> ${response.body}");
//         // setState(() {});
//       } else {
//         debugPrint("Status Code -------------->>> ${response.statusCode}");
//       }
//     } finally {
//       client.close();
//     }
//   }
//
//   setPostsAPI() async {
//     Client client = http.Client();
//     try {
//       Response response = await client.post(
//         Uri.parse("https://jsonplaceholder.typicode.com/posts"),
//         headers: {
//           'Content-type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode({
//           "userId": 11,
//           "it": 101,
//           "title": "dcjhvjbdv",
//           "body": "denj",
//         }),
//       );
//       if (response.statusCode == 200) {
//         debugPrint("Response -------------->>> ${jsonDecode(response.body)}");
//         // setState(() {});
//       } else if (response.statusCode == 201) {
//         debugPrint("Response -------------->>> ${jsonDecode(response.body)}");
//         // setState(() {});
//       } else if (response.statusCode == 404) {
//         debugPrint("Status Code 404-------------->>> ${response.statusCode}");
//       } else {
//         debugPrint("Status Code -------------->>> ${response.statusCode}");
//       }
//     } finally {
//       client.close();
//     }
//   }
//
//   putPostsAPI() async {
//     Client client = http.Client();
//     try {
//       Response response = await client.put(
//         Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
//         headers: {
//           'Content-type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode({
//           "userId": 11,
//           "it": 101,
//           "title": "dcjhvjbdv",
//           "body": "denj",
//         }),
//       );
//       debugPrint("Status Code -------------->>> ${response.statusCode}");
//       if (response.statusCode == 200) {
//         debugPrint("Response -------------->>> ${jsonDecode(response.body)}");
//         // setState(() {});
//       } else {
//         debugPrint("Status Code -------------->>> ${response.statusCode}");
//       }
//     } finally {
//       client.close();
//     }
//   }
//
//   deletePostsAPI() async {
//     Client client = http.Client();
//     try {
//       Response response = await client
//           .delete(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
//       debugPrint("Status Code -------------->>> ${response.statusCode}");
//       if (response.statusCode == 200) {
//         debugPrint("Response -------------->>> ${jsonDecode(response.body)}");
//       } else {
//         debugPrint("Status Code -------------->>> ${response.statusCode}");
//       }
//     } finally {
//       client.close();
//     }
//   }
// }
