import 'dart:math' hide log;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/grid_selection_model.dart';
import 'package:stitchin_time/models/palette_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/pixel_model.dart';
import 'package:stitchin_time/models/reference_model.dart';
import 'package:stitchin_time/models/references_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/grid_selection_provider.dart';
import 'package:stitchin_time/providers/overpaint_pattern_provider.dart';
import 'package:stitchin_time/providers/palette_provider.dart';
import 'package:stitchin_time/providers/pan_data_provider.dart';
import 'package:stitchin_time/providers/pattern_provider.dart';
import 'package:stitchin_time/providers/reference_points_provider.dart';
import 'package:stitchin_time/providers/references_provider.dart';
import 'package:stitchin_time/providers/theme_provider.dart';

class Grid extends ConsumerWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    PaletteModel paletteModel = ref.watch(paletteProvider);
    return Container(
      width: canvasModel.gridInfo.getWidth() * canvasModel.zoomInfo.zoomValue,
      height: canvasModel.gridInfo.getHeight() * canvasModel.zoomInfo.zoomValue,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(color: paletteModel.swatches[0].getColor(), borderRadius: BorderRadius.circular(5)),
      child: CustomPaint(
        painter: MyPainter(context: context, ref: ref),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final BuildContext context;
  final WidgetRef ref;
  MyPainter({required this.context, required this.ref});

  @override
  void paint(ui.Canvas canvas, Size size) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    PatternModel patternModel = ref.watch(patternProvider);
    PaletteModel paletteModel = ref.watch(paletteProvider);
    ReferencesModel referencesModel = ref.watch(referencesProvider);
    GridSelectionModel gridSelectionModel = ref.watch(gridSelectionProvider);
    List<Offset> referencePoints = ref.watch(referencePointsProvider);
    PatternModel panDataPattern = ref.watch(panDataProvider).getShifted();
    PatternModel overpaintPattern = ref.watch(overpaintPatternProvider);
    ThemeData themeData = ref.watch(themeProvider);
    Paint paint = Paint()
      ..strokeWidth = 1.0
      ..color = Colors.grey.shade900.withAlpha(255);

    var renderBox = context.findRenderObject() as RenderBox?;
    var gridPos = renderBox!.localToGlobal(Offset.zero);
    _paintGridLines(canvas, size, canvasModel, paletteModel, paint);
    _paintMainPixels(canvas, size, canvasModel, patternModel, paletteModel, paint);
    _paintMainPixels(canvas, size, canvasModel, panDataPattern, paletteModel, paint);

    _paintNumbers(
      canvas,
      size,
      canvasModel,
      ref.read(themeProvider).colorScheme.onPrimaryContainer,
      ref.read(themeProvider).colorScheme.primary,
      gridPos,
      // hoverPixel,
    );
    _paintRepeatBackgrounds(canvas, size, canvasModel, paletteModel, overpaintPattern);
    _paintRepeats(canvas, size, canvasModel, paletteModel, overpaintPattern, paint);

    _paintPhantomPixels(canvas, size, canvasModel, paletteModel, paint);
    _paintReferences(canvas, size, canvasModel, referencesModel, paint);
    _paintReferencePoints(canvas, paint, referencePoints, canvasModel.zoomInfo.zoomValue, themeData);

    _paintHoverCircle(canvas, canvasModel);
    _paintSelection(canvas, size, gridSelectionModel, paint, canvasModel, paletteModel);
    // _paintPanSelection();
    // if (activeTool == Tools.stamp) {
    //   _paintStampData(
    //     canvas,
    //     size,
    //     canvasModel,
    //     stampModel,
    //     paletteModel,
    //     hoverPixel,
    //     paint,
    //   );
    // }
  }

  void _paintNumbers(
    ui.Canvas canvas,
    Size size,
    CanvasModel canvasModel,
    Color fontColorA,
    Color fontColorB,
    Offset gridPosition,
    // PixelModel hoverPixel,
  ) {
    double fontSize = (size.width / canvasModel.gridInfo.getWidth()) * 18;
    // Color highlightColor = ref.read(themeProvider).colorScheme.tertiary.withAlpha(150);

    for (int i = 1; i <= canvasModel.gridInfo.columns; i++) {
      // bool isActive = canvasModel.gridInfo.columns - i == hoverPixel.column;

      (int, int) cellA = (canvasModel.gridInfo.columns - i, -1);
      (int, int) cellB = (canvasModel.gridInfo.columns - i, canvasModel.gridInfo.rows);
      Offset offsetA = _getOffsetFromCell(cellA, size);
      Offset offsetB = _getOffsetFromCell(cellB, size);
      if (gridPosition.dy - 45 < offsetA.dy.abs() * 2) {
        offsetA += Offset(0, offsetA.dy.abs() * 2 - gridPosition.dy + 45);
      }

      var windowHeight = MediaQuery.of(context).size.height;
      if (gridPosition.dy + offsetB.dy + canvasModel.gridInfo.cellHeight * 0.5 > windowHeight) {
        double dif = windowHeight - (gridPosition.dy + offsetB.dy + canvasModel.gridInfo.cellHeight * 0.5);
        offsetB += Offset(0, dif);
      }
      TextStyle style = GoogleFonts.anonymousPro(
        // fontSize: fontSize * (isActive ? 1.2 : 1),
        // color: isActive
        //     ? highlightColor
        //     : i.isEven
        //     ? fontColorA
        //     : fontColorB,
        fontSize: fontSize,
        color: i.isEven ? fontColorA : fontColorB,
      );
      TextSpan textSpan = TextSpan(text: i.toString(), style: style);
      TextPainter textPainter = TextPainter(
        textAlign: TextAlign.center,
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: canvasModel.gridInfo.cellWidth * 30.0 * canvasModel.zoomInfo.zoomValue,
        maxWidth: double.infinity,
      );

      textPainter.paint(canvas, offsetA - Offset(textPainter.width / 2, textPainter.height / 2));
      textPainter.paint(canvas, offsetB - Offset(textPainter.width / 2, textPainter.height / 2));
    }

    for (int i = 1; i <= canvasModel.gridInfo.rows; i++) {
      // bool isActive = canvasModel.gridInfo.rows - i == hoverPixel.row;

      (int, int) cellA = (-1, canvasModel.gridInfo.rows - i);
      (int, int) cellB = (canvasModel.gridInfo.columns, canvasModel.gridInfo.rows - i);
      Offset offsetA = _getOffsetFromCell(cellA, size);
      Offset offsetB = _getOffsetFromCell(cellB, size);

      if (gridPosition.dx < offsetA.dx.abs() * 2) {
        offsetA += Offset(offsetA.dx.abs() * 2 - gridPosition.dx, 0);
      }

      var windowWidth = MediaQuery.of(context).size.width;
      if (gridPosition.dx + offsetB.dx + canvasModel.gridInfo.cellWidth * 0.5 > windowWidth) {
        double dif = windowWidth - (gridPosition.dx + offsetB.dx + canvasModel.gridInfo.cellWidth * 0.5);
        offsetB += Offset(dif, 0);
      }
      TextStyle style = GoogleFonts.anonymousPro(
        // fontSize: fontSize * (isActive ? 1.2 : 1),
        // color: isActive
        //     ? highlightColor
        //     : i.isEven
        //     ? fontColorA
        //     : fontColorB,
        fontSize: fontSize,
        color: i.isEven ? fontColorA : fontColorB,
      );
      TextSpan textSpan = TextSpan(text: i.toString(), style: style);
      TextPainter textPainter = TextPainter(
        textAlign: TextAlign.center,
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: canvasModel.gridInfo.cellWidth * 3 * canvasModel.zoomInfo.zoomValue,
        maxWidth: canvasModel.gridInfo.cellWidth * 3 * canvasModel.zoomInfo.zoomValue,
      );

      textPainter.paint(canvas, offsetA - Offset(textPainter.width / 2, textPainter.height / 2));
      textPainter.paint(canvas, offsetB - Offset(textPainter.width / 2, textPainter.height / 2));
    }
  }

  void _paintGridLines(ui.Canvas canvas, Size size, CanvasModel canvasModel, PaletteModel paletteModel, Paint paint) {
    double backgroundColorLuminance = paletteModel.swatches[0].getColor().computeLuminance();
    Color lineColor = backgroundColorLuminance > 0.015 ? Colors.grey.shade800 : Colors.grey.shade700;
    paint.strokeWidth = 1;
    int highlightDelta = 10;
    for (int i = 1; i < canvasModel.gridInfo.columns; i++) {
      paint.color = i % highlightDelta == 0 ? ref.read(themeProvider).colorScheme.onPrimary : lineColor;
      Offset p1 = Offset(size.width / canvasModel.gridInfo.columns * i, 0);
      Offset p2 = Offset(size.width / canvasModel.gridInfo.columns * i, size.height);
      canvas.drawLine(p1, p2, paint);
    }

    for (int i = 1; i < canvasModel.gridInfo.rows; i++) {
      paint.color = i % highlightDelta == 0 ? ref.read(themeProvider).colorScheme.onPrimary : lineColor;
      Offset p1 = Offset(0, size.height / canvasModel.gridInfo.rows * i);
      Offset p2 = Offset(size.width, size.height / canvasModel.gridInfo.rows * i);
      canvas.drawLine(p1, p2, paint);
    }
  }

  void _paintReferences(
    ui.Canvas canvas,
    Size size,
    CanvasModel canvasModel,
    ReferencesModel referencesModel,
    Paint paint,
  ) {
    int counter = -1;
    for (ReferenceModel reference in referencesModel.references) {
      counter++;
      // ui.Image refImage = reference.refImg!;
      // var decodedints = base64Decode(reference.base64encodedImageString);
      // var refImage = ref.read(referencesProvider.notifier).getImage(reference);
      if (reference.refImg == null) {
        ref.read(referencesProvider.notifier).cacheImageData(reference, counter);
        continue;
      }
      ui.Image refImage = reference.refImg!;
      canvas.save();
      canvas.clipRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.5), width: size.width, height: size.height),
          Radius.circular(5),
        ),
      );
      canvas.translate(
        reference.posX * (size.width / canvasModel.gridInfo.getWidth()),
        reference.posY * (size.height / canvasModel.gridInfo.getHeight()),
      );
      canvas.rotate(reference.rotAngle * pi / 180);

      (double, double) stretchFactors = _getRotatedStretchFactors(size, canvasModel, reference.rotAngle);

      paintImage(
        canvas: canvas,
        rect: Rect.fromCenter(
          center: Offset(0, 0),
          width: refImage.width * stretchFactors.$1 / reference.scale,
          height: refImage.height * stretchFactors.$2 / reference.scale,
        ),
        image: refImage,
        opacity: reference.opacity,
        fit: BoxFit.fill,
      );

      canvas.restore();
    }
  }

  void _paintMainPixels(
    ui.Canvas canvas,
    Size size,
    CanvasModel canvasModel,
    PatternModel patternModel,
    PaletteModel paletteModel,
    Paint paint,
  ) {
    for (PixelModel pixel in patternModel.pixelMap.values) {
      var cell = (pixel.column, pixel.row);
      if (!canvasModel.gridInfo.isCellWithinCanvas(cell)) continue;
      paint.color = paletteModel.swatches[pixel.mySwatchIndex].getColor();
      Offset center = _getOffsetFromCell((pixel.column, pixel.row), size);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center,
            width: size.width / canvasModel.gridInfo.columns * 0.915,
            height: size.height / canvasModel.gridInfo.rows * 0.915,
          ),
          Radius.circular((pixel.mySwatchIndex == 0 ? 0 : 3) * (size.width / canvasModel.gridInfo.getWidth())),
        ),
        paint,
      );
    }
  }

  void _paintPhantomPixels(
    ui.Canvas canvas,
    Size size,
    CanvasModel canvasModel,
    PaletteModel paletteModel,
    Paint paint,
  ) {
    List<PixelModel> phantomPixels = canvasModel.phantomPixels.pixelMap.values.toList();
    if (phantomPixels.isEmpty) return;
    for (PixelModel pixel in phantomPixels) {
      var cell = (pixel.column, pixel.row);

      if (!canvasModel.gridInfo.isCellWithinCanvas(cell)) continue;
      paint.color = paletteModel.swatches[pixel.mySwatchIndex].getColor();
      Offset center = _getOffsetFromCell((pixel.column, pixel.row), size);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center,
            width: canvasModel.gridInfo.cellWidth * 0.55 * canvasModel.zoomInfo.zoomValue,
            height: canvasModel.gridInfo.cellHeight * 0.55 * canvasModel.zoomInfo.zoomValue,
          ),
          Radius.circular(3),
        ),
        paint,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center,
            width: canvasModel.gridInfo.cellWidth * 0.25 * canvasModel.zoomInfo.zoomValue,
            height: canvasModel.gridInfo.cellHeight * 0.25 * canvasModel.zoomInfo.zoomValue,
          ),
          Radius.circular(3),
        ),
        Paint()..color = paletteModel.swatches[0].getColor(),
      );
    }
  }

  void _paintReferencePoints(
    ui.Canvas canvas,
    Paint paint,
    List<Offset> referencePoints,
    double canvasZoom,
    ThemeData themeData,
  ) {
    if (referencePoints[0] != referencePoints[1]) {
      canvas.drawCircle(referencePoints[0], 5 * canvasZoom, paint..color = themeData.colorScheme.tertiaryContainer);
      canvas.drawCircle(referencePoints[1], 5 * canvasZoom, paint..color = themeData.colorScheme.tertiaryContainer);
      canvas.drawLine(referencePoints[0], referencePoints[1], paint..color = themeData.colorScheme.tertiaryContainer);
    }
  }

  void _paintSelection(
    ui.Canvas canvas,
    Size size,
    GridSelectionModel gridSelectionModel,
    Paint paint,
    CanvasModel canvasModel,
    PaletteModel paletteModel,
  ) {
    if (!gridSelectionModel.isActive) return;

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = ref.read(themeProvider).colorScheme.primary
      ..strokeJoin = StrokeJoin.miter;
    Offset startOffset =
        _getOffsetFromCell((gridSelectionModel.startPixel.column, gridSelectionModel.startPixel.row), size) -
        _getOffsetFromCell((1, 1), size) * 0.35;
    Offset endOffset =
        _getOffsetFromCell((gridSelectionModel.endPixel.column, gridSelectionModel.endPixel.row), size) +
        _getOffsetFromCell((1, 1), size) * 0.35;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(startOffset.dx, startOffset.dy, endOffset.dx, endOffset.dy),
        Radius.circular(2),
      ),
      paint,
    );
  }

  void _paintHoverCircle(ui.Canvas canvas, CanvasModel canvasModel) {
    // canvas.drawCircle(canvasModel.hoverOffset, 10, Paint());
  }

  void _paintRepeats(
    ui.Canvas canvas,
    Size size,
    CanvasModel canvasModel,
    PaletteModel paletteModel,
    PatternModel overpaintPatternModel,
    Paint paint,
  ) {
    int alpha = 255;
    for (PixelModel pixel in overpaintPatternModel.pixelMap.values) {
      paint.color = paletteModel.swatches[pixel.mySwatchIndex].getColor()..withAlpha(alpha);
      Offset center = _getOffsetFromCell((pixel.column, pixel.row), size);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center,
            width: size.width / canvasModel.gridInfo.columns * 0.915,
            height: size.height / canvasModel.gridInfo.rows * 0.915,
          ),
          Radius.circular((pixel.mySwatchIndex == 0 ? 0 : 3) * (size.width / canvasModel.gridInfo.getWidth())),
        ),
        paint,
      );
    }
  }

  void _paintRepeatBackgrounds(
    ui.Canvas canvas,
    Size size,
    CanvasModel canvasModel,
    PaletteModel paletteModel,
    PatternModel overpaintPatternModel,
  ) {
    int overpaintAmount = canvasModel.overpaintAmount;
    int alpha = 150;
    int spacing = 1;
    //Overpaint Columns
    double vertOff = canvasModel.gridInfo.getHeight() * canvasModel.zoomInfo.zoomValue * 0.5;
    for (int i = -1; i <= 1; i += 2) {
      double horiOff =
          canvasModel.gridInfo.getWidth() * canvasModel.zoomInfo.zoomValue * (i == -1 ? 0 : 1) +
          (canvasModel.overpaintAmount * canvasModel.gridInfo.cellWidth * 0.5 * canvasModel.zoomInfo.zoomValue * (i) +
              spacing * i);

      Offset center = Offset(horiOff, vertOff);

      double width = canvasModel.gridInfo.cellWidth * overpaintAmount * canvasModel.zoomInfo.zoomValue;

      double height = canvasModel.gridInfo.getHeight() * canvasModel.zoomInfo.zoomValue;

      Rect rect = Rect.fromCenter(center: center, width: width, height: height);

      RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(5));

      canvas.drawRRect(rrect, Paint()..color = paletteModel.swatches[0].getColor().withAlpha(alpha));
    }
    //Overpaint Rows
    double horiOff = canvasModel.gridInfo.getWidth() * canvasModel.zoomInfo.zoomValue * 0.5;
    for (int i = -1; i <= 1; i += 2) {
      double vertOff =
          canvasModel.gridInfo.getHeight() * canvasModel.zoomInfo.zoomValue * (i == -1 ? 0 : 1) +
          (canvasModel.overpaintAmount * canvasModel.gridInfo.cellHeight * 0.5 * canvasModel.zoomInfo.zoomValue * (i)) +
          spacing * i;

      Offset center = Offset(horiOff, vertOff);

      double width = canvasModel.gridInfo.getWidth() * canvasModel.zoomInfo.zoomValue;

      double height = canvasModel.gridInfo.cellHeight * overpaintAmount * canvasModel.zoomInfo.zoomValue;

      Rect rect = Rect.fromCenter(center: center, width: width, height: height);

      RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(5));

      canvas.drawRRect(rrect, Paint()..color = paletteModel.swatches[0].getColor().withAlpha(alpha));
    }
  }

  (double, double) _getRotatedStretchFactors(Size size, CanvasModel canvasModel, double rotationAngle) {
    double sinVal = sin(rotationAngle * pi / 180).abs();
    double oneMinusSinVal = 1.0 - sinVal;
    double horizontalStretch = size.width / canvasModel.gridInfo.getWidth();
    double verticalStretch = size.height / canvasModel.gridInfo.getHeight();

    double adjustedHorizontalStretch = (sinVal * verticalStretch) + (oneMinusSinVal * horizontalStretch);
    double adjustedverticalStretch = (sinVal * horizontalStretch) + (oneMinusSinVal * verticalStretch);
    return (adjustedHorizontalStretch, adjustedverticalStretch);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  Offset _getOffsetFromCell((int, int) cell, Size size) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    double offsetX =
        cell.$1 * size.width / canvasModel.gridInfo.columns + (size.width / canvasModel.gridInfo.columns * 0.5);
    double offsetY =
        cell.$2 * size.height / canvasModel.gridInfo.rows + (size.height / canvasModel.gridInfo.rows * 0.5);
    Offset offset = Offset(offsetX, offsetY);
    return offset;
  }
}
