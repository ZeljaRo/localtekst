import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class InternalFileListScreen extends StatefulWidget {
  const InternalFileListScreen({super.key});

  @override
  State<InternalFileListScreen> createState() => _InternalFileListScreenState();
}

class _InternalFileListScreenState extends State<InternalFileListScreen> {
  List<FileSystemEntity> allFiles = [];
  List<FileSystemEntity> filteredFiles = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInternalFiles();
    _searchController.addListener(_filterFiles);
  }

  Future<void> _loadInternalFiles() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync().where((f) => f.path.endsWith('.txt')).toList();
    setState(() {
      allFiles = files;
      filteredFiles = files;
    });
  }

  void _filterFiles() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredFiles = allFiles.where((file) {
        final name = file.path.split('/').last.toLowerCase();
        return name.contains(query);
      }).toList();
    });
  }

  void _openFile(String filePath) {
    Navigator.pushNamed(context, '/song-text', arguments: filePath);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interni fajlovi')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Pretraži fajlove',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFiles.length,
              itemBuilder: (context, index) {
                final file = filteredFiles[index];
                final fileName = file.path.split('/').last;
                return ListTile(
                  title: Text(fileName),
                  onTap: () => _openFile(file.path),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
