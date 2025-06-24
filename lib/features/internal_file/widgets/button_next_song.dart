import 'package:flutter/material.dart';

class ButtonNextSong extends StatelessWidget {
  const ButtonNextSong({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_forward),
      tooltip: 'Sljedeća pjesma',
      onPressed: () {},
    );
  }
}
