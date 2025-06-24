import 'package:flutter/material.dart';

class ButtonLock extends StatelessWidget {
  const ButtonLock({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.lock),
      onPressed: () {},
      tooltip: 'Zaključavanje',
    );
  }
}
