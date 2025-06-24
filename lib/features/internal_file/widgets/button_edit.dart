import 'package:flutter/material.dart';

class ButtonEdit extends StatelessWidget {
  const ButtonEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {},
      tooltip: 'Uredi tekst',
    );
  }
}
