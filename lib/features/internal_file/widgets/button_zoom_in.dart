import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/zoom_controller.dart';

class ButtonZoomIn extends StatelessWidget {
  const ButtonZoomIn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.zoom_in),
      tooltip: 'Poveæaj font',
      onPressed: () {
        final zoomController = Provider.of<ZoomController>(context, listen: false);
        zoomController.increaseFontSize();
      },
    );
  }
}
