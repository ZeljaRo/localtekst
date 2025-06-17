import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'features/folder_picker/screens/folder_selector_screen.dart';
import 'features/internal_file/screens/internal_file_list_screen.dart';
import 'features/internal_file/screens/song_text_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      // ➜ POČETNI EKRAN s 2 dugmeta
      home: const HomeScreen(),
      // ➜ Rute za ostale ekrane
      routes: {
        '/folder-selector': (context) => const FolderSelectorScreen(),
        '/internal-files': (context) => const InternalFileListScreen(),
        '/song-text': (context) => const SongTextScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LocalText')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/folder-selector');
              },
              child: const Text('Odaberi mapu'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/internal-files');
              },
              child: const Text('Pregled internih fajlova'),
            ),
          ],
        ),
      ),
    );
  }
}
