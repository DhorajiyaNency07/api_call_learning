import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/second_character_model.dart';

class ApiService {
  static const baseUrl = 'https://rickandmortyapi.com/api';

  static Future<List<Character>> getCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/character'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      final characters =
      results.map((json) => Character.fromJson(json)).toList();
      return characters;
    } else {
      throw Exception('Failed to fetch characters');
    }
  }

  static Future<Character> getCharacter(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/character/$id'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final character = Character.fromJson(data);
      return character;
    } else {
      throw Exception('Failed to fetch character');
    }
  }

  static Future<Character> addCharacter(Character character) async {
    final response = await http.post(
      Uri.parse('$baseUrl/character'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(character.toJson()),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final addedCharacter = Character.fromJson(data);
      return addedCharacter;
    } else {
      throw Exception('Failed to add character');
    }
  }

  static Future<void> updateCharacter(Character character) async {
    final response = await http.put(
      Uri.parse('$baseUrl/character/${character.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(character.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update character');
    }
  }

  static Future<void> deleteCharacter(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/character/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete character');
    }
  }
}
