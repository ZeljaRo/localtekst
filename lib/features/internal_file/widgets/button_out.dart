import 'package:flutter/material.dart';

class ButtonOut extends StatelessWidget {
  const ButtonOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('OUT'),
      ),
    );
  }
}
