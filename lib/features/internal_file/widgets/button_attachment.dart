import 'package:flutter/material.dart';

class ButtonAttachment extends StatelessWidget {
  const ButtonAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.attach_file),
      onPressed: () {},
      tooltip: 'Prateći fajl',
    );
  }
}
