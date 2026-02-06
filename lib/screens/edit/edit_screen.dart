import 'package:flutter/material.dart';
import 'package:stitchin_time/screens/edit/edit_custom_painter.dart';
import 'package:stitchin_time/screens/edit/edit_gesture_detector.dart';
import 'package:stitchin_time/screens/edit/edit_overlay_mobile.dart';
import 'package:stitchin_time/screens/edit/edit_shortcuts.dart';

class EditScreen extends StatelessWidget {
  final bool isWide;
  const EditScreen({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Stack(
        alignment: Alignment.center,
        children: [
          //outside gestures
          EditScreenGestureDetector(
            child: OverflowBox(maxWidth: double.infinity, maxHeight: double.infinity, alignment: Alignment.center),
          ),
          EditShortcuts(),
          //grid
          OverflowBox(maxHeight: double.infinity, maxWidth: double.infinity, child: EditCustomPainter()),
          // EditCustomPainter(),
          // overlay
          EditOverlayMobile(isWide: isWide),
        ],
      ),
    );
  }
}
