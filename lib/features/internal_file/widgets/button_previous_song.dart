import 'package:flutter/material.dart';

class ButtonPreviousSong extends StatelessWidget {
  const ButtonPreviousSong({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      tooltip: 'Prethodna pjesma',
      onPressed: () {},
    );
  }
}
