import 'package:flutter/material.dart';
import 'file_service.dart';

void main() {
  runApp(const FileHandlingApp());
}

class FileHandlingApp extends StatelessWidget {
  const FileHandlingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter File Handling',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FileHandlingScreen(),
    );
  }
}

class FileHandlingScreen extends StatefulWidget {
  const FileHandlingScreen({super.key});

  @override
  State<FileHandlingScreen> createState() => _FileHandlingScreenState();
}

class _FileHandlingScreenState extends State<FileHandlingScreen> {
  final controller = TextEditingController();

  String fileContent = '';
  String message = 'Checking for previously saved file...';

  @override
  void initState() {
    super.initState();
    _loadPreviousFile();
  }

  // Load previously saved file when app starts
  Future<void> _loadPreviousFile() async {
    try {
      final content = await FileService.readFile();

      setState(() {
        fileContent = content;
        controller.text = content;
        message = 'Previously saved file loaded.';
      });
    } catch (_) {
      setState(() {
        message = 'No previously saved file found.';
      });
    }
  }

  Future<void> _writeFile() async {
    if (controller.text.trim().isEmpty) {
      setState(() => message = 'Please enter some text first.');
      return;
    }

    try {
      final result = await FileService.writeFile(controller.text);

      setState(() {
        fileContent = controller.text;
        message = result;
      });
    } catch (e) {
      setState(() => message = e.toString());
    }
  }

  Future<void> _readFile() async {
    try {
      final content = await FileService.readFile();

      setState(() {
        fileContent = content;
        controller.text = content;
        message = 'File read successfully.';
      });
    } catch (e) {
      setState(() => message = e.toString());
    }
  }

  Future<void> _deleteFile() async {
    try {
      await FileService.deleteFile();

      setState(() {
        fileContent = '';
        controller.clear();
        message = 'File deleted successfully.';
      });
    } catch (e) {
      setState(() => message = e.toString());
    }
  }

  void _showLibrary(String name, String description) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(name),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter File Handling'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: Icon(
                Icons.folder_copy,
                size: 70,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                'Libraries and File Handling',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Center(
              child: Text(
                'Create, write, read and delete a text file.',
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              '1. External Libraries',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // path_provider
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.folder,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  'path_provider',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Access application directories',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _showLibrary(
                    'path_provider',
                    'Provides access to application directories. '
                    'It is used to find a suitable location for storing files.',
                  );
                },
              ),
            ),

            // shared_preferences
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.storage,
                  color: Colors.blue,
                ),
                title: const Text(
                  'shared_preferences',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Persistent storage for Flutter Web',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _showLibrary(
                    'shared_preferences',
                    'Stores small amounts of data persistently. '
                    'In Flutter Web, it is used as the storage alternative.',
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              '2. File Storage',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: controller,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Enter file content',
                hintText: 'Type something here...',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton.icon(
                  onPressed: _writeFile,
                  icon: const Icon(Icons.save),
                  label: const Text('Write'),
                ),

                ElevatedButton.icon(
                  onPressed: _readFile,
                  icon: const Icon(Icons.folder_open),
                  label: const Text('Read'),
                ),

                ElevatedButton.icon(
                  onPressed: _deleteFile,
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Status
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              '3. Stored File Content',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                fileContent.isEmpty
                    ? 'No file content available.'
                    : fileContent,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}