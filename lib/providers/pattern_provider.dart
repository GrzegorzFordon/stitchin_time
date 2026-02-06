import 'dart:ui';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/extensions/extensions.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/grid_selection_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/pixel_model.dart';
import 'package:stitchin_time/models/project_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/grid_selection_provider.dart';
import 'package:stitchin_time/providers/history_provider.dart';
import 'package:stitchin_time/providers/palette_provider.dart';
import 'package:stitchin_time/providers/project_provider.dart';
part 'pattern_provider.g.dart';

@riverpod
class Pattern extends _$Pattern {
  @override
  PatternModel build() {
    ProjectModel projectModel = ref.read(projectProvider);
    return projectModel.pattern;
  }

  void add(PatternModel model) {
    Map<String, PixelModel> map = {};
    map.addAll(state.pixelMap);
    map.addAll(model.pixelMap);
    state = PatternModel(pixelMap: map);
    ref.read(projectProvider.notifier).updateProject(pattern: state);
  }

  void remove(PatternModel model) {
    Map<String, PixelModel> map = {};
    map.addAll(state.pixelMap);
    for (String key in model.pixelMap.keys) {
      map.remove(key);
    }
    state = PatternModel(pixelMap: map);
    ref.read(projectProvider.notifier).updateProject(pattern: state);
  }

  void undo() => state = ref.read(historyProvider.notifier).pop(undo: true).pattern;

  void redo() => state = ref.read(historyProvider.notifier).pop(undo: false).pattern;

  void shift(Offset offset) {
    ref.read(historyProvider.notifier).push();
    GridSelectionModel gridSelectionModel = ref.read(gridSelectionProvider);
    PatternModel shiftedPatternModel = PatternModel(
      pixelMap: Map.from(state.pixelMap)..removeWhere((_, value) => _isWithinSelection(value, gridSelectionModel)),
    );
    for (int i = gridSelectionModel.startPixel.column; i < gridSelectionModel.endPixel.column + 1; i++) {
      for (int j = gridSelectionModel.startPixel.row; j < gridSelectionModel.endPixel.row + 1; j++) {
        (int, int) shiftedCell = (i + offset.dx.toInt(), j + offset.dy.toInt());
        bool stateHas = state.pixelMap.containsKey((i, j).toString());
        if (!stateHas) {
          shiftedPatternModel.pixelMap.remove(shiftedCell.toString());
          continue;
        }
        PixelModel shiftedPixel = PixelModel(
          column: shiftedCell.$1,
          row: shiftedCell.$2,
          mySwatchIndex: state.pixelMap[(i, j).toString()]!.mySwatchIndex,
        );
        shiftedPatternModel.pixelMap[shiftedCell.toString()] = shiftedPixel;
      }
    }

    state = shiftedPatternModel;
    ref.read(projectProvider.notifier).updateProject(pattern: state);
  }

  void shiftAll(Offset offset) {
    PatternModel newModel = PatternModel(pixelMap: {});
    for (PixelModel pixel in state.pixelMap.values) {
      PixelModel newPixel = PixelModel(
        column: pixel.column + offset.dx.toInt(),
        row: pixel.row + offset.dy.toInt(),
        mySwatchIndex: pixel.mySwatchIndex,
      );
      newModel.pixelMap[(newPixel.column, newPixel.row).toString()] = newPixel;
    }
    state = newModel;
    ref.read(projectProvider.notifier).updateProject(pattern: state);
  }

  void mirror(bool horizontal, bool vertical) {
    if (!horizontal && !vertical) return;

    GridSelectionModel gridSelectionModel = ref.read(gridSelectionProvider);
    PatternModel shiftedPatternModel = PatternModel(
      pixelMap: Map.from(state.pixelMap)..removeWhere((_, value) => _isWithinSelection(value, gridSelectionModel)),
    );
    for (int i = gridSelectionModel.startPixel.column; i < gridSelectionModel.endPixel.column + 1; i++) {
      for (int j = gridSelectionModel.startPixel.row; j < gridSelectionModel.endPixel.row + 1; j++) {
        (int, int) shiftedCell = (
          horizontal ? gridSelectionModel.endPixel.column - i + gridSelectionModel.startPixel.column : i,
          vertical ? gridSelectionModel.endPixel.row - j + gridSelectionModel.startPixel.row : j,
        );
        bool stateHas = state.pixelMap.containsKey((i, j).toString());
        if (!stateHas) continue;
        PixelModel shiftedPixel = PixelModel(
          column: shiftedCell.$1,
          row: shiftedCell.$2,
          mySwatchIndex: state.pixelMap[(i, j).toString()]!.mySwatchIndex,
        );
        shiftedPatternModel.pixelMap[shiftedCell.toString()] = shiftedPixel;
      }
    }

    state = shiftedPatternModel;
    ref.read(projectProvider.notifier).updateProject(pattern: state);
    ref.read(historyProvider.notifier).push();
  }

  void deleteSelection() {
    GridSelectionModel gridSelectionModel = ref.read(gridSelectionProvider);
    PatternModel removedPattern = PatternModel(
      pixelMap: Map.from(state.pixelMap)..removeWhere((_, value) => _isWithinSelection(value, gridSelectionModel)),
    );

    state = removedPattern;
    ref.read(projectProvider.notifier).updateProject(pattern: state);
    ref.read(historyProvider.notifier).push();
  }

  void floodFill((int, int) startingCell) {
    CanvasModel canvasModel = ref.read(canvasProvider);
    int activeSwatchIndex = ref.read(paletteProvider).activeSwatchIndex;
    int startingCellSwatchIndex = -1;
    ref.read(historyProvider.notifier).push();

    if (state.pixelMap.containsKey(startingCell.toString())) {
      PixelModel startingPixel = state.pixelMap[startingCell.toString()]!;
      startingCellSwatchIndex = startingPixel.mySwatchIndex;
    }
    PatternModel pattern = PatternModel(pixelMap: {});
    List<(int, int)> candidates = [startingCell];

    int counter = 0;

    while (candidates.isNotEmpty && counter < 500000) {
      counter++;
      (int, int) currentCell = candidates.removeLast();
      if (!canvasModel.gridInfo.isCellWithinCanvas(currentCell) ||
          pattern.pixelMap.containsKey(currentCell.toString())) {
        continue;
      }

      if (state.pixelMap.containsKey(currentCell.toString())) {
        if (state.pixelMap[currentCell.toString()]!.mySwatchIndex == startingCellSwatchIndex) {
          pattern.pixelMap[currentCell.toString()] = PixelModel(
            column: currentCell.$1,
            row: currentCell.$2,
            mySwatchIndex: activeSwatchIndex,
          );
          candidates.add(currentCell + (1, 0));
          candidates.add(currentCell + (-1, 0));
          candidates.add(currentCell + (0, 1));
          candidates.add(currentCell + (0, -1));
        }
      } else if (startingCellSwatchIndex == -1) {
        pattern.pixelMap[currentCell.toString()] = PixelModel(
          column: currentCell.$1,
          row: currentCell.$2,
          mySwatchIndex: activeSwatchIndex,
        );
        candidates.add(currentCell + (1, 0));
        candidates.add(currentCell + (-1, 0));
        candidates.add(currentCell + (0, 1));
        candidates.add(currentCell + (0, -1));
      }
    }

    add(pattern);
  }

  bool _isWithinSelection(PixelModel value, GridSelectionModel gridSelectionModel) {
    bool isWithinColumn =
        value.column >= gridSelectionModel.startPixel.column && value.column <= gridSelectionModel.endPixel.column;
    bool isWithinRow = value.row >= gridSelectionModel.startPixel.row && value.row <= gridSelectionModel.endPixel.row;
    bool isWithin = isWithinRow && isWithinColumn;
    return isWithin;
  }
}
