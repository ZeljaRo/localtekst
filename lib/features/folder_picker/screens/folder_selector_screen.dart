import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:path_provider/path_provider.dart';

class FolderSelectorScreen extends StatefulWidget {
  const FolderSelectorScreen({super.key});

  @override
  State<FolderSelectorScreen> createState() => _FolderSelectorScreenState();
}

class _FolderSelectorScreenState extends State<FolderSelectorScreen> {
  List<XFile> _files = [];

  Future<void> _selectFolderAndListFiles() async {
    final directory = await getDirectoryPath();
    if (directory == null) return;

    final folder = Directory(directory);
    final allFiles = folder.listSync();
    final txtFiles = allFiles
        .where((f) =>
            f is File &&
            f.path.toLowerCase().endsWith('.txt'))
        .map((f) => XFile(f.path))
        .toList();

    setState(() {
      _files = txtFiles;
    });
  }

  Future<void> _copySelectedFiles(List<XFile> selectedFiles) async {
    final targetDir = await getApplicationDocumentsDirectory();
    for (final file in selectedFiles) {
      final fileName = file.name;
      final newPath = '${targetDir.path}/$fileName';
      await File(file.path).copy(newPath);
      debugPrint('[KOPIRANO] ${file.path} -> $newPath');
    }
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fajlovi kopirani.')),
      );
    }
  }

  final Set<XFile> _selected = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Odaberite mapu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.folder_open),
            onPressed: _selectFolderAndListFiles,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _files.length,
              itemBuilder: (context, index) {
                final file = _files[index];
                final selected = _selected.contains(file);
                return CheckboxListTile(
                  title: Text(file.name),
                  value: selected,
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selected.add(file);
                      } else {
                        _selected.remove(file);
                      }
                    });
                  },
                );
              },
            ),
          ),
          if (_files.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _copySelectedFiles(_files),
                    child: const Text('Kopiraj sve'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () => _copySelectedFiles(_selected.toList()),
                    child: const Text('Kopiraj označene'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
