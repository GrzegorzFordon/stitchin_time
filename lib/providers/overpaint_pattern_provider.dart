import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/pixel_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/pattern_provider.dart';

part 'overpaint_pattern_provider.g.dart';

@riverpod
class OverpaintPattern extends _$OverpaintPattern {
  @override
  PatternModel build() {
    PatternModel patternModel = ref.watch(patternProvider);
    CanvasModel canvasModel = ref.watch(canvasProvider);
    PatternModel overpaintPattern = _getOverpaints(patternModel, canvasModel);
    return overpaintPattern;
  }

  PatternModel _getOverpaints(PatternModel patternModel, CanvasModel canvasModel) {
    PatternModel overpaintPattern = PatternModel(pixelMap: {});
    for (PixelModel pixel in patternModel.pixelMap.values) {
      if (!canvasModel.gridInfo.isCellWithinCanvas((pixel.column, pixel.row))) continue;
      bool isCloseToColumnStart = pixel.column < canvasModel.overpaintAmount;
      bool isCloseToColumnEnd = pixel.column >= canvasModel.gridInfo.columns - canvasModel.overpaintAmount;
      bool isCloseToRowStart = pixel.row < canvasModel.overpaintAmount;
      bool isCloseToRowEnd = pixel.row >= canvasModel.gridInfo.rows - canvasModel.overpaintAmount;

      if (isCloseToColumnStart) {
        (int, int) cell = (pixel.column + canvasModel.gridInfo.columns, pixel.row);
        PixelModel overpaintPixel = PixelModel(column: cell.$1, row: cell.$2, mySwatchIndex: pixel.mySwatchIndex);
        overpaintPattern.pixelMap[cell.toString()] = overpaintPixel;
      }
      if (isCloseToColumnEnd) {
        (int, int) cell = (pixel.column - canvasModel.gridInfo.columns, pixel.row);
        PixelModel overpaintPixel = PixelModel(column: cell.$1, row: cell.$2, mySwatchIndex: pixel.mySwatchIndex);
        overpaintPattern.pixelMap[cell.toString()] = overpaintPixel;
      }

      if (isCloseToRowStart) {
        (int, int) cell = (pixel.column, pixel.row + canvasModel.gridInfo.rows);
        PixelModel overpaintPixel = PixelModel(column: cell.$1, row: cell.$2, mySwatchIndex: pixel.mySwatchIndex);
        overpaintPattern.pixelMap[cell.toString()] = overpaintPixel;
      }
      if (isCloseToRowEnd) {
        (int, int) cell = (pixel.column, pixel.row - canvasModel.gridInfo.rows);
        PixelModel overpaintPixel = PixelModel(column: cell.$1, row: cell.$2, mySwatchIndex: pixel.mySwatchIndex);
        overpaintPattern.pixelMap[cell.toString()] = overpaintPixel;
      }
    }
    return overpaintPattern;
  }
}
