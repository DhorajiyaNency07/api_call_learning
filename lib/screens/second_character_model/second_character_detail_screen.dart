import 'package:api_call_learning/models/second_character_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(character.image!),
            const SizedBox(height: 16.0),
            Text('Name: ${character.name}'),
            const SizedBox(height: 8.0),
            Text('Status: ${character.status}'),
            const SizedBox(height: 8.0),
            Text('Species: ${character.species}'),
            const SizedBox(height: 8.0),
            Text('Type: ${character.type}'),
            const SizedBox(height: 8.0),
            Text('Gender: ${character.gender}'),
          ],
        ),
      ),
    );
  }
}
