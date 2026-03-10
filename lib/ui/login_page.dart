import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Gunakan controller agar input lebih stabil
  final TextEditingController _uNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Biar ke tengah
          children: [
            TextField(
              controller: _uNameController,
              decoration: const InputDecoration(
                labelText: 'Username (NIM)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password (Prodi)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity, // Tombol selebar layar
              child: ElevatedButton(
                onPressed: () {
                  String uName = _uNameController.text;
                  String pass = _passController.text;

                  // Sesuaikan dengan NIM dan Prodi kamu
                  if (uName == '123230020' && pass == 'Informatika') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(username: uName),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Login Gagal! Username/Password Salah"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Bersihkan controller saat tidak dipakai
  @override
  void dispose() {
    _uNameController.dispose();
    _passController.dispose();
    super.dispose();
  }
}