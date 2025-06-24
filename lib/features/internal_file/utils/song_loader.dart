import 'dart:io';

Future<String> loadSongText(String fileName) async {
  final directory = Directory('copied_txt');
  final file = File('${directory.path}/$fileName');
  return await file.readAsString();
}
