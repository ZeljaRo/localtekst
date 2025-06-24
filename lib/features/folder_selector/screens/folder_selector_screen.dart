import 'package:flutter/material.dart';
import 'package:localtekst/features/internal_file/screens/internal_file_list_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class FolderSelectorScreen extends StatelessWidget {
  const FolderSelectorScreen({super.key});

  Future<void> _requestPermissionAndNavigate(BuildContext context) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InternalFileListScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission denied')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocalTekst'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _requestPermissionAndNavigate(context),
          child: const Text('Pregled internih fajlova'),
        ),
      ),
    );
  }
}
