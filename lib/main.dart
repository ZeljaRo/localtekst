import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';

void main() {
  runApp(const MaterialApp(home: SafTxtViewer()));
}

class SafTxtViewer extends StatefulWidget {
  const SafTxtViewer({super.key});

  @override
  State<SafTxtViewer> createState() => _SafTxtViewerState();
}

class _SafTxtViewerState extends State<SafTxtViewer> {
  List<XFile> selectedFiles = [];

  Future<void> pickTxtFiles() async {
    final txtGroup = XTypeGroup(
      label: 'Text files',
      extensions: ['txt'],
    );

    final files = await openFiles(acceptedTypeGroups: [txtGroup]);

    if (files.isEmpty) return;

    setState(() {
      selectedFiles = files;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SAF TXT Viewer')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: pickTxtFiles,
            child: const Text('Odaberi TXT fajlove'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedFiles.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(selectedFiles[index].name)),
            ),
          ),
        ],
      ),
    );
  }
}
