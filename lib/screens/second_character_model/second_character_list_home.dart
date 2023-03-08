import 'package:flutter/material.dart';
import '../../model/second_character_model.dart';
import '../../utils/second_character_all_task_function.dart';
import 'second_character_detail_screen.dart';


class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  List<Character> _characters = [];

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
  }

  Future<void> _fetchCharacters() async {
    try {
      final characters = await ApiService.getCharacters();
      setState(() {
        _characters = characters;
      });
    } catch (e) {
      print(e);
    }
  }

  void _showDialog(String operation, {Character? character}) {
    final nameController = TextEditingController(text: character?.name ?? '');
    final statusController =
    TextEditingController(text: character?.status ?? '');
    final speciesController =
    TextEditingController(text: character?.species ?? '');
    final typeController = TextEditingController(text: character?.type ?? '');

    showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
            title: Text('$operation Character'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: statusController,
                  decoration: const InputDecoration(
                    labelText: 'Status',
                  ),
                ),
                TextField(
                  controller: speciesController,
                  decoration: const InputDecoration(
                    labelText: 'Species',
                  ),
                ),
                TextField(
                  controller: typeController,
                  decoration: const InputDecoration(
                    labelText: 'Type',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  final newCharacter = Character(
                    name: nameController.text,
                    status: statusController.text,
                    species: speciesController.text,
                    type: typeController.text,
                  );

                  switch (operation) {
                    case 'Add':
                      try {
                        final addedCharacter =
                        await ApiService.addCharacter(newCharacter);
                        setState(() {
                          _characters.add(addedCharacter);
                        });
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                        // debugPrint(e);
                        // return "error";
                      }
                      break;
                    case 'Edit':
                      if (character != null) {
                        final editedCharacter = character;
                        // final editedCharacter = character(
                        //   name: nameController.text,
                        //   status: statusController.text,
                        //   species: speciesController.text,
                        //   type: typeController.text,
                        // );
                        try {
                          await ApiService.updateCharacter(editedCharacter);
                          setState(() {
                            final index = _characters.indexOf(character);
                            _characters[index] = editedCharacter;
                          });
                          Navigator.pop(context);
                        } catch (e) {
                          print(e);
                        }
                      }
                      break;
                  }
                },
                child: Text(operation),
              ),
            ],
          ),
    );
  }

  void _deleteCharacter(Character character) async {
    try {
      await ApiService.deleteCharacter(character.id!);
      setState(() {
        _characters.remove(character);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: ListView.builder(
        itemCount: _characters.length,
        itemBuilder: (context, index) {
          final character = _characters[index];
          return ListTile(
            title: Text(character.name!),
            subtitle: Text(character.status!),
            trailing: IconButton(
              icon: const Icon(Icons.delete,color: Colors.red,),
              onPressed: () => _deleteCharacter(character),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      CharacterDetailScreen(
                        character: character,
                      ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _fetchCharacters(),
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () => _showDialog('Add'),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () => _showDialog('PUT', character: _characters.first),
            child: const Icon(Icons.edit),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () =>
                _showDialog('DELETE', character: _characters.first),
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

