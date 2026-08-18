import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: const Text("Task 2"),
        ),
        body: const Center(
          child: Text(
            "Hello, World!",
            style: TextStyle(fontSize: 24,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
