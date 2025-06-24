import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/song_controls_row.dart';

class SongTextScreen extends StatelessWidget {
  const SongTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String filePath = ModalRoute.of(context)!.settings.arguments as String;
    final file = File(filePath);

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          const SongControlsRow(),
          const Divider(height: 1),
          Expanded(
            child: FutureBuilder<String>(
              future: file.readAsString(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Greška pri učitavanju fajla.'));
                } else {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Text(snapshot.data ?? '', style: const TextStyle(fontSize: 18)),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
