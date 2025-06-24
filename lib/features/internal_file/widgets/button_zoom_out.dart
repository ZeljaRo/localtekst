import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/zoom_controller.dart';

class ButtonZoomOut extends StatelessWidget {
  const ButtonZoomOut({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.zoom_out),
      tooltip: 'Smanji font',
      onPressed: () {
        final zoomController = Provider.of<ZoomController>(context, listen: false);
        zoomController.decreaseFontSize();
      },
    );
  }
}
