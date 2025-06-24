import 'package:flutter/material.dart';
import 'button_previous_song.dart';
import 'button_next_song.dart';
import 'button_transpose_up.dart';
import 'button_transpose_down.dart';
import 'button_zoom_in.dart';
import 'button_zoom_out.dart';
import 'button_attachment.dart';
import 'button_edit.dart';
import 'button_settings.dart';
import 'button_search.dart';
import 'button_lock.dart';
import 'button_out.dart';

class SongControlsRow extends StatelessWidget {
  const SongControlsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: const [
          ButtonSearch(),
          ButtonTransposeDown(),
          ButtonTransposeUp(),
          ButtonLock(),
          ButtonOut(),
          ButtonZoomOut(),
          ButtonZoomIn(),
          ButtonAttachment(),
          ButtonEdit(),
          ButtonSettings(),
          ButtonPreviousSong(),
          ButtonNextSong(),
        ],
      ),
    );
  }
}
