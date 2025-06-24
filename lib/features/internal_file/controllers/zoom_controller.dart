import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZoomController extends ChangeNotifier {
  double _zoom = 18.0;
  final String fileName;

  ZoomController(this.fileName) {
    loadZoom();
  }

  double get zoom => _zoom;

  Future<void> loadZoom() async {
    final prefs = await SharedPreferences.getInstance();
    _zoom = prefs.getDouble('zoom_$fileName') ?? 18.0;
    notifyListeners();
  }

  Future<void> increaseFontSize() async {
    _zoom += 2;
    await _saveZoom();
    notifyListeners();
  }

  Future<void> decreaseFontSize() async {
    _zoom -= 2;
    await _saveZoom();
    notifyListeners();
  }

  Future<void> _saveZoom() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('zoom_$fileName', _zoom);
  }
}
