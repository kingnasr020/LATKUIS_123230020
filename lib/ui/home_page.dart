import 'package:flutter/material.dart';
import '../models/animals_data.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Untuk melacak posisi menu yang aktif

  @override
  Widget build(BuildContext context) {
    // List halaman yang akan ditampilkan berdasarkan menu yang dipilih
    final List<Widget> _pages = [
      _buildHomeContent(), // Menu 0: List Hewan
      _buildProfileContent(), // Menu 1: Profile
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? "Animal List" : "My Profile"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: _pages[_currentIndex], // Menampilkan halaman sesuai index
      
      // INI BAGIAN NAVBARNYA
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update index saat icon di-klik
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Animals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Widget untuk isi halaman Home (List Hewan)
  Widget _buildHomeContent() {
    return ListView.builder(
      itemCount: dummyAnimals.length,
      itemBuilder: (context, index) {
        final animal = dummyAnimals[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(animal.image, width: 50, height: 50, fit: BoxFit.cover),
            ),
            title: Text(animal.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(animal.type),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnimalDetailPage(animal: animal)),
              );
            },
          ),
        );
      },
    );
  }

  // Widget untuk isi halaman Profile
  Widget _buildProfileContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.orangeAccent,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            "Logged in as: ${widget.username}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text("Informatics Student"),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context), // Kembali ke Login
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
          )
        ],
      ),
    );
  }
}