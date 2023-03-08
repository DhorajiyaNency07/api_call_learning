import 'package:api_call_learning/screens/post_model_list/home_screen.dart';
import 'package:flutter/material.dart';

import 'screens/second_character_model/second_character_list_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomeScreen(),
      home: const CharacterListScreen(),
    );
  }
}
