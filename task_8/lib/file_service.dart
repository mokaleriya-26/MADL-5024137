import 'file_service_io.dart'
    if (dart.library.html) 'file_service_web.dart';

class FileService {
  static Future<String> writeFile(String content) {
    return writeTextFile(content);
  }

  static Future<String> readFile() {
    return readTextFile();
  }

  static Future<void> deleteFile() {
    return deleteTextFile();
  }
}