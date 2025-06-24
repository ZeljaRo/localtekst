import 'package:flutter/material.dart';

class ButtonSettings extends StatelessWidget {
  const ButtonSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {},
      tooltip: 'Postavke prikaza',
    );
  }
}
