import 'package:flutter/material.dart';
import '../../models/character_model.dart';

class CharacterModelDetailsPage extends StatelessWidget {
  final Results? results;
  final Info? info;

  const CharacterModelDetailsPage({
    Key? key,
    this.results,
    this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${results!.id}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("name: ${results!.name}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Image.network("${results!.image}"),
            Text("result id: ${results!.id}",
                style: const TextStyle(fontSize: 18)),
            Text("location : ${results!.location!.name}",
                style: const TextStyle(fontSize: 18)),
            Text("origin : ${results!.origin!.name}",
                style: const TextStyle(fontSize: 18)),
            Text("species: ${results!.species}",
                style: const TextStyle(fontSize: 18)),
            Text("status: ${results!.status}"),
            Text("type: ${results!.type}"),
            const SizedBox(height: 16),
            Text("info count: ${info!.count}",
                style: const TextStyle(fontSize: 18)),
            Text("info pages: ${info!.pages}",
                style: const TextStyle(fontSize: 18)),
            Text("info prev: ${info!.prev}",
                style: const TextStyle(fontSize: 18)),
            Text("info next: ${info!.next}",
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
