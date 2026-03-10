import 'package:flutter/material.dart';
// IMPORT FILE MODEL (Yang ada tulisan 'class Animal')
import '../models/animal_model.dart'; 

class AnimalDetailPage extends StatelessWidget {
  final Animal animal;
  
  const AnimalDetailPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView( // Pakai ini agar aman kalau layar HP kecil
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              animal.image, 
              width: double.infinity, 
              height: 250, 
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type: ${animal.type}", style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text("Habitat: ${animal.habitat.join(", ")}"),
                  const SizedBox(height: 8),
                  Text("Weight: ${animal.weight} kg | Height: ${animal.height} cm"),
                  const Divider(height: 30),
                  const Text("Activities:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  // Render list aktivitas
                  ...animal.activities.map((act) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text("• $act"),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}