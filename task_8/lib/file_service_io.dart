import 'dart:io';

import 'package:path_provider/path_provider.dart';

const String fileName = 'student_notes.txt';

Future<String> writeTextFile(String content) async {
  try {
    final directory =
        await getApplicationDocumentsDirectory();

    final file = File(
      '${directory.path}/$fileName',
    );

    await file.writeAsString(content);

    return 'File written successfully.\n'
        'Location: ${file.path}';
  } catch (error) {
    throw Exception(
      'Unable to write file: $error',
    );
  }
}

Future<String> readTextFile() async {
  try {
    final directory =
        await getApplicationDocumentsDirectory();

    final file = File(
      '${directory.path}/$fileName',
    );

    if (!await file.exists()) {
      throw Exception(
        'File does not exist. Please create it first.',
      );
    }

    final content = await file.readAsString();

    return content;
  } catch (error) {
    throw Exception(
      'Unable to read file: $error',
    );
  }
}

Future<void> deleteTextFile() async {
  try {
    final directory =
        await getApplicationDocumentsDirectory();

    final file = File(
      '${directory.path}/$fileName',
    );

    if (await file.exists()) {
      await file.delete();
    }
  } catch (error) {
    throw Exception(
      'Unable to delete file: $error',
    );
  }
}