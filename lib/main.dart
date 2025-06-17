import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'features/folder_picker/screens/folder_selector_screen.dart';

void main() {
  runApp(const LocalTextApp());
}

class LocalTextApp extends StatefulWidget {
  const LocalTextApp({super.key});

  @override
  State<LocalTextApp> createState() => _LocalTextAppState();
}

class _LocalTextAppState extends State<LocalTextApp> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocalText',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const FolderSelectorScreen(),
    );
  }
}
