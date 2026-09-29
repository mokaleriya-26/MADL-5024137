import 'package:flutter/material.dart';

void main() {
  runApp(const ProductionApp());
}

class ProductionApp extends StatelessWidget {
  const ProductionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Production Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Production Flutter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.verified,
                size: 80,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 20),

              const Text(
                'Flutter App Ready',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Tested, debugged and prepared for Android deployment.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('App is working correctly!'),
                    ),
                  );
                },
                icon: const Icon(Icons.check),
                label: const Text('Test App'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}