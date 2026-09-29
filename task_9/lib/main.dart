import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Database',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final courseController = TextEditingController();

  final DatabaseReference database =
      FirebaseDatabase.instance.ref('students');

  String message = '';

  // WRITE DATA
  Future<void> addStudent() async {
    if (nameController.text.trim().isEmpty ||
        courseController.text.trim().isEmpty) {
      setState(() {
        message = 'Please enter name and course.';
      });
      return;
    }

    try {
      await database.push().set({
        'name': nameController.text.trim(),
        'course': courseController.text.trim(),
      });

      nameController.clear();
      courseController.clear();

      setState(() {
        message = 'Data saved successfully!';
      });
    } catch (e) {
      setState(() {
        message = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Realtime Database'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: Icon(
                Icons.cloud,
                size: 70,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                'Flutter + Firebase',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Enter Student Data',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                labelText: 'Course',
                prefixIcon: Icon(Icons.school),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: addStudent,
                icon: const Icon(Icons.cloud_upload),
                label: const Text('Save to Firebase'),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Text(
                message,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Students from Firebase',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // READ DATA
            StreamBuilder<DatabaseEvent>(
              stream: database.onValue,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    'Error reading Firebase data.',
                  );
                }

                if (!snapshot.hasData ||
                    snapshot.data!.snapshot.value == null) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'No students found.',
                      ),
                    ),
                  );
                }

                final data = Map<dynamic, dynamic>.from(
                  snapshot.data!.snapshot.value as Map,
                );

                return Column(
                  children: data.entries.map((entry) {
                    final student =
                        Map<dynamic, dynamic>.from(entry.value);

                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(
                          student['name'] ?? '',
                        ),
                        subtitle: Text(
                          'Course: ${student['course'] ?? ''}',
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}