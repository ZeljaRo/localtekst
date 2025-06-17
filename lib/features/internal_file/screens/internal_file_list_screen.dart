import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class InternalFileListScreen extends StatefulWidget {
  const InternalFileListScreen({super.key});

  @override
  State<InternalFileListScreen> createState() => _InternalFileListScreenState();
}

class _InternalFileListScreenState extends State<InternalFileListScreen> {
  List<FileSystemEntity> internalFiles = [];

  @override
  void initState() {
    super.initState();
    _loadInternalFiles();
  }

  Future<void> _loadInternalFiles() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync().where((f) => f.path.endsWith('.txt')).toList();
    setState(() {
      internalFiles = files;
    });
  }

  void _openFile(String filePath) {
    Navigator.pushNamed(context, '/song-text', arguments: filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interni fajlovi')),
      body: ListView.builder(
        itemCount: internalFiles.length,
        itemBuilder: (context, index) {
          final file = internalFiles[index];
          final fileName = file.path.split('/').last;
          return ListTile(
            title: Text(fileName),
            onTap: () => _openFile(file.path),
          );
        },
      ),
    );
  }
}
