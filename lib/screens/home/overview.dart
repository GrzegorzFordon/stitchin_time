import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/palette_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/pixel_model.dart';
import 'package:stitchin_time/models/project_model.dart';

class Overview extends ConsumerWidget {
  final ProjectModel project;

  const Overview({super.key, required this.project});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 300),
      child: AspectRatio(
        aspectRatio: project.canvas.gridInfo.columns / project.canvas.gridInfo.rows,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            // color: Colors.grey.shade800,
            color: project.palette.swatches[0].getColor(),

            borderRadius: BorderRadius.circular(5),
          ),
          child: CustomPaint(
            painter: MyPainter(ref: ref, project: project),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final WidgetRef ref;
  final ProjectModel project;

  MyPainter({required this.ref, required this.project});

  @override
  void paint(canvas, Size size) {
    CanvasModel canvasModel = project.canvas;
    PatternModel patternModel = project.pattern;
    PaletteModel paletteModel = project.palette;

    double widthCellSize = size.width / canvasModel.gridInfo.columns;
    double heightCellSize = size.height / canvasModel.gridInfo.rows;

    Paint paint = Paint()
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..color = Colors.grey.shade900.withAlpha(255);

    //Region Main Pixels
    paint.style = PaintingStyle.fill;
    for (PixelModel pixel in patternModel.pixelMap.values) {
      paint.color = paletteModel.swatches[pixel.mySwatchIndex].getColor();
      if (!_isCellWithinCanvas((pixel.column, pixel.row), canvasModel)) {
        continue;
      }
      Offset center = _getOffsetFromCell(
        (pixel.column, pixel.row),
        widthCellSize,
        heightCellSize,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center,
            width: widthCellSize,
            height: heightCellSize,
          ),
          Radius.circular(0),
        ),
        paint,
      );
    }
    //endregion
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  Offset _getOffsetFromCell(
    (int, int) cell,
    double widthCellSize,
    double heightCellSize,
  ) {
    double offsetX = widthCellSize * cell.$1 * 1.0 + (widthCellSize * 0.5);
    double offsetY = heightCellSize * cell.$2 * 1.0 + (heightCellSize * 0.5);
    Offset offset = Offset(offsetX, offsetY);
    return offset;
  }

  bool _isCellWithinCanvas((int, int) cell, CanvasModel canvasModel) {
    bool isNotNegative = cell.$1 >= 0 && cell.$2 >= 0;
    bool isNotBeyond =
        cell.$1 < canvasModel.gridInfo.columns && cell.$2 < canvasModel.gridInfo.rows;
    return isNotNegative && isNotBeyond;
  }
}
