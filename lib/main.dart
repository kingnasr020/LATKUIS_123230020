import 'package:flutter/material.dart';
import 'ui/login_page.dart'; // Pastikan path folder ui benar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Kuis TPM',
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Standar Flutter terbaru
      ),
      home: const LoginPage(), // Halaman pertama yang muncul
    );
  }
}