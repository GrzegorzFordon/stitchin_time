import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/grid_selection_model.dart';
import 'package:stitchin_time/models/palette_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/pixel_model.dart';
import 'package:stitchin_time/models/view_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/chart_block_provider.dart';
import 'package:stitchin_time/providers/palette_provider.dart';
import 'package:stitchin_time/providers/pattern_provider.dart';
import 'package:stitchin_time/providers/view_provider.dart';
import 'dart:ui' as ui;

class Chart extends ConsumerWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    ViewModel viewModel = ref.watch(viewProvider);
    PaletteModel paletteModel = ref.watch(paletteProvider);

    int amount = 4;
    List<Widget> children = [];

    for (int i = -amount; i <= amount; i++) {
      int activeRow = canvasModel.gridInfo.rows - viewModel.activeRow - 1;
      double scale = 2.0 - 0.015 * i.abs();
      double alpha = 255 - (i.abs() * 50);
      alpha = alpha.clamp(50, 255);
      bool isActive = i == 0;
      children.add(
        ChartRow(
          canvasModel: canvasModel,
          row: activeRow + i,
          scale: scale * viewModel.zoomInfo.zoomValue,
          alpha: alpha,
          isActive: isActive,
          backgroundColor: paletteModel.swatches[0].getColor(),
        ),
      );
    }

    return Stack(
      children: [
        OverflowBox(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, spacing: 12, children: children),
        ),
      ],
    );
  }
}

class ChartRow extends ConsumerWidget {
  final CanvasModel canvasModel;
  final int row;
  final double scale;
  final double alpha;
  final bool isActive;
  final Color backgroundColor;
  const ChartRow({
    super.key,
    required this.canvasModel,
    required this.row,
    required this.scale,
    required this.alpha,
    required this.isActive,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isRelevant = row >= 0 && row < ref.read(canvasProvider).gridInfo.rows;
    return isRelevant
        ? Container(
            decoration: BoxDecoration(
              color: backgroundColor.withAlpha(alpha.toInt()),
              borderRadius: BorderRadius.circular(5),
            ),
            width: canvasModel.gridInfo.getWidth() * scale,
            height: canvasModel.gridInfo.cellHeight * 1.0 * scale * (isActive ? 1.1 : 1.0),
            child: CustomPaint(
              painter: ChartPainter(
                row: row,
                ref: ref,
                scale: scale,
                alpha: alpha,
                context: context,
                isActive: isActive,
              ),
            ),
          )
        : SizedBox(width: 100, height: canvasModel.gridInfo.cellHeight * 1.0 * scale);
  }
}

class ChartPainter extends CustomPainter {
  final WidgetRef ref;
  final int row;
  final double scale;
  final double alpha;
  final bool isActive;

  BuildContext context;
  ChartPainter({
    required this.row,
    required this.ref,
    required this.scale,
    required this.alpha,
    required this.context,
    required this.isActive,
  });

  @override
  void paint(ui.Canvas canvas, Size size) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    PatternModel patternModel = ref.watch(patternProvider);
    PaletteModel paletteModel = ref.watch(paletteProvider);
    ViewModel viewModel = ref.watch(viewProvider);
    GridSelectionModel chartBlockModel = ref.watch(chartBlockProvider);

    Paint paint = Paint();
    _paintGridLines(canvas, size, canvasModel, paint);
    _paintMainPixels(canvas, size, canvasModel, patternModel, paletteModel, scale, paint);
    _paintRowNumber(canvas, size, canvasModel, viewModel, paint);
    _paintOutline(canvas, size, canvasModel);
    _paintActiveBlock(canvas, viewModel, canvasModel, chartBlockModel, size);
  }

  void _paintGridLines(ui.Canvas canvas, Size size, CanvasModel canvasModel, Paint paint) {
    for (int i = 1; i < canvasModel.gridInfo.columns; i++) {
      paint.color = Colors.grey.shade900.withAlpha(alpha.toInt());
      Offset p1 = Offset(size.width / canvasModel.gridInfo.columns * i, 0);
      Offset p2 = Offset(size.width / canvasModel.gridInfo.columns * i, size.height);
      canvas.drawLine(p1, p2, paint);
    }
  }

  void _paintMainPixels(
    ui.Canvas canvas,
    Size size,
    CanvasModel canvasModel,
    PatternModel patternModel,
    PaletteModel paletteModel,
    double scale,
    Paint paint,
  ) {
    for (PixelModel pixel in patternModel.pixelMap.values.where((element) => element.row == row)) {
      paint.color = paletteModel.swatches[pixel.mySwatchIndex].getColor().withAlpha(alpha.toInt());
      Offset center = _getOffsetFromCell((pixel.column, pixel.row), size);
      if (!canvasModel.gridInfo.isCellWithinCanvas((pixel.column, pixel.row))) {
        continue;
      }
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center,
            width: canvasModel.gridInfo.cellWidth * (size.width / canvasModel.gridInfo.getWidth()) * 0.95,
            height:
                canvasModel.gridInfo.cellHeight *
                (size.width / canvasModel.gridInfo.getWidth()) *
                0.95 *
                (isActive ? 1.1 : 1.0),
          ),
          Radius.circular(3),
        ),
        paint,
      );
    }
  }

  void _paintActiveBlock(
    ui.Canvas canvas,
    ViewModel viewModel,
    CanvasModel canvasModel,
    GridSelectionModel chartBlockModel,
    Size size,
  ) {
    if (!isActive) return;

    Color activeColor = ref.read(paletteProvider).swatches[chartBlockModel.startPixel.mySwatchIndex].getColor();

    var activeColorLuminance = activeColor.computeLuminance();
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color paintColor = activeColorLuminance > 0.01 ? colorScheme.onSecondaryFixed : colorScheme.primary;

    Paint paint = Paint()
      ..color = paintColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;

    Offset startCenter = _getOffsetFromCell((
      canvasModel.gridInfo.columns - 1 - chartBlockModel.startPixel.column,
      viewModel.activeRow,
    ), size);
    canvas.drawCircle(startCenter, 10 * max(viewModel.zoomInfo.zoomValue, 1), paint..style = PaintingStyle.fill);
    Offset endCenter = _getOffsetFromCell((
      canvasModel.gridInfo.columns - 1 - chartBlockModel.endPixel.column,
      viewModel.activeRow,
    ), size);
    canvas.drawCircle(endCenter, 10 * max(viewModel.zoomInfo.zoomValue, 1), paint..style = PaintingStyle.fill);

    canvas.drawLine(startCenter, endCenter, paint);

    canvas.drawCircle(
      Offset.lerp(startCenter, endCenter, 0.5)!,
      15 * max(viewModel.zoomInfo.zoomValue, 1),
      Paint()..color = activeColor,
    );

    int blockLength = chartBlockModel.endPixel.column - chartBlockModel.startPixel.column + 1;
    TextStyle textStyle = GoogleFonts.chewy(fontSize: 32 * max(viewModel.zoomInfo.zoomValue, 1), color: paint.color);
    TextSpan textSpan = TextSpan(text: blockLength.toString(), style: textStyle);
    TextPainter textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 70, maxWidth: 70);
    Offset offset =
        Offset.lerp(startCenter, endCenter, 0.5)! - Offset(textPainter.width * 0.5, textPainter.height * 0.5);
    textPainter.paint(canvas, offset);
  }

  void _paintRowNumber(ui.Canvas canvas, Size size, CanvasModel canvasModel, ViewModel viewModel, Paint paint) {
    TextSpan textSpan = TextSpan(
      text: (canvasModel.gridInfo.rows - row).toString(),
      style: GoogleFonts.anonymousPro(
        fontSize: (15 * (size.width / canvasModel.gridInfo.getWidth())).clamp(0, 50),
        color: (canvasModel.gridInfo.rows - row).isEven
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.secondaryContainer,
      ),
    );
    TextPainter textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 50, maxWidth: 50);
    Offset pos = Offset(
      -canvasModel.gridInfo.cellWidth * 1.0 - 20,
      canvasModel.gridInfo.cellHeight * viewModel.zoomInfo.zoomValue * 0.5,
    );
    textPainter.paint(canvas, pos);
    pos = Offset(
      size.width + canvasModel.gridInfo.cellWidth * 1.0 - 20,
      canvasModel.gridInfo.cellHeight * viewModel.zoomInfo.zoomValue * 0.5,
    );
    textPainter.paint(canvas, pos);
  }

  void _paintOutline(ui.Canvas canvas, Size size, CanvasModel canvasModel) {
    if (!isActive) return;
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Theme.of(context).colorScheme.onSecondaryFixedVariant
      ..strokeWidth = 2;
    Offset center = size.center(Offset.zero);
    Rect rect = Rect.fromCenter(center: center, width: size.width, height: size.height);
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(5));
    canvas.drawRRect(rrect, paint);
  }

  Offset _getOffsetFromCell((int, int) cell, Size size) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    double offsetY = size.width * (isActive ? 1.1 : 1.0) / canvasModel.gridInfo.columns * 0.5;
    double offsetX =
        cell.$1 * size.width / canvasModel.gridInfo.columns + (size.width / canvasModel.gridInfo.columns * 0.5);
    Offset offset = Offset(offsetX, offsetY);
    return offset;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
