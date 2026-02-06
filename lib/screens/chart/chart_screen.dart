
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/grid_selection_model.dart';
import 'package:stitchin_time/models/view_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/chart_block_provider.dart';
import 'package:stitchin_time/providers/chart_offset_provider.dart';
import 'package:stitchin_time/providers/view_provider.dart';
import 'package:stitchin_time/screens/chart/chart_gesture_detector.dart';
import 'package:stitchin_time/screens/chart/chart_overlay.dart';
import 'package:stitchin_time/screens/chart/chart_shortcuts.dart';
import 'package:stitchin_time/screens/chart/chart.dart';

class ChartScreen extends ConsumerWidget {
  final bool isWide;
  const ChartScreen({super.key, required this.isWide});

  final Curve curve = Curves.decelerate;
  final int duration = 500;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    GridSelectionModel chartBlock = ref.watch(chartBlockProvider);
    CanvasModel canvasModel = ref.watch(canvasProvider);
    ViewModel viewModel = ref.watch(viewProvider);

    Offset panOffset = ref.watch(chartOffsetProvider);
    Offset offset = getCenterOffset(
      chartBlock,
      canvasModel,
      viewModel,
      MediaQuery.sizeOf(context),
    );

    return FocusScope(
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => AnimatedSlide(
              duration: Duration(
                milliseconds: panOffset == Offset.zero ? duration : 0,
              ),
              curve: curve,
              offset: panOffset / MediaQuery.sizeOf(context).width,
              child: AnimatedSlide(
                duration: Duration(milliseconds: duration),
                curve: curve,
                offset: offset / constraints.maxWidth,
                child: Chart(),
              ),
            ),
          ),
          ChartGestureDetector(),
          ChartShortcuts(),
          ChartOverlay(isWide: isWide),
        ],
      ),
    );
  }

  Offset getCenterOffset(
    GridSelectionModel chartBlock,
    CanvasModel canvasModel,
    ViewModel viewModel,
    Size size,
  ) {
    Offset startOffset = getOffsetFromCell(
      chartBlock.startPixel.column,
      size,
      canvasModel,
      viewModel,
    );
    Offset endOffset = getOffsetFromCell(
      chartBlock.endPixel.column,
      size,
      canvasModel,
      viewModel,
    );
    Offset centerOffset =
        Offset.lerp(startOffset, endOffset, 0.5)! -
        Offset(canvasModel.gridInfo.getWidth(), 0);
    return centerOffset * viewModel.zoomInfo.zoomValue;
  }

  Offset getOffsetFromCell(
    int column,
    Size size,
    CanvasModel canvasModel,
    ViewModel viewModel,
  ) {
    double offsetX =
        column * canvasModel.gridInfo.cellWidth * 2.0 +
        (canvasModel.gridInfo.cellWidth * 1.0);
    Offset offset = Offset(offsetX, 0);
    return offset;
  }
}
