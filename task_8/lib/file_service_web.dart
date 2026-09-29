import 'package:shared_preferences/shared_preferences.dart';

const String fileName = 'student_notes.txt';

Future<String> writeTextFile(String content) async {
  try {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      fileName,
      content,
    );

    return 'File saved successfully using '
        'Web persistent storage.';
  } catch (error) {
    throw Exception(
      'Unable to save file: $error',
    );
  }
}

Future<String> readTextFile() async {
  try {
    final prefs =
        await SharedPreferences.getInstance();

    final content =
        prefs.getString(fileName);

    if (content == null) {
      throw Exception(
        'File does not exist. Please create it first.',
      );
    }

    return content;
  } catch (error) {
    throw Exception(
      'Unable to read file: $error',
    );
  }
}

Future<void> deleteTextFile() async {
  try {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.remove(fileName);
  } catch (error) {
    throw Exception(
      'Unable to delete file: $error',
    );
  }
}