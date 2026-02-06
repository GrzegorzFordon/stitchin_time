import 'dart:io';
import 'dart:math' hide log;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stitchin_time/models/tool_info_model.dart';
import 'package:stitchin_time/models/pan_data_model.dart';
import 'package:stitchin_time/models/reference_model.dart';
import 'package:stitchin_time/models/tool_model.dart';
import 'package:stitchin_time/providers/canvas_offset_provider.dart';
import 'package:stitchin_time/providers/pan_data_provider.dart';
import 'package:stitchin_time/providers/platform_provider.dart';
import 'package:stitchin_time/providers/user_provider.dart';
import 'package:stitchin_time/screens/edit/grid.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/grid_selection_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/pixel_model.dart';
import 'package:stitchin_time/models/references_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/grid_selection_provider.dart';
import 'package:stitchin_time/providers/history_provider.dart';
import 'package:stitchin_time/providers/palette_provider.dart';
import 'package:stitchin_time/providers/pattern_provider.dart';
import 'package:stitchin_time/providers/reference_points_provider.dart';
import 'package:stitchin_time/providers/references_provider.dart';
import 'package:stitchin_time/providers/stamp_provider.dart';
import 'package:stitchin_time/providers/tool_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditCustomPainter extends HookConsumerWidget {
  const EditCustomPainter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> twoPointersUsed = useState(false);
    ValueNotifier<double> cachedPrevScale = useState(1.0);
    ValueNotifier<(int, int)> startCell = useState((0, 0));
    ValueNotifier<bool> isSecondary = useState(false);
    Offset gridOffset = ref.watch(canvasOffsetProvider);
    // bool isDesktop = kIsWeb;
    // if (!kIsWeb) isDesktop = (Platform.isWindows || Platform.isMacOS || Platform.isLinux)&&!(Platform.isAndroid||Platform.isIOS);
    bool isInputTouch = ref.watch(lastUsedPointerDeviceKindIsTouchProvider);
    // useEffect(() {
    //   log(isSecondary.value.toString());
    //   return null;
    // }, [isSecondary.value]);

    return Listener(
      onPointerHover: (event) => ref.read(lastUsedPointerDeviceKindIsTouchProvider.notifier).set(event.kind),
      onPointerSignal: (event) {
        ref.read(lastUsedPointerDeviceKindIsTouchProvider.notifier).set(event.kind);

        if (event is PointerScrollEvent && !isInputTouch) {
          int step = -event.scrollDelta.dy.sign.toInt();
          ref.read(canvasProvider.notifier).zoomStepped(step);
        }
      },
      onPointerUp: (event) => isSecondary.value = false,
      child: GestureDetector(
        dragStartBehavior: DragStartBehavior.start,
        onTapUp: (details) {
          _onPointerDown(details.localPosition, 1, twoPointersUsed, startCell, isSecondary, ref);
          _onTapUp(details, ref);
          isSecondary.value = false;
        },
        onScaleStart: (details) =>
            _onPointerDown(details.localFocalPoint, details.pointerCount, twoPointersUsed, startCell, isSecondary, ref),
        onScaleUpdate: (details) => isSecondary.value && (!isInputTouch)
            ? ref.read(canvasOffsetProvider.notifier).add(details.focalPointDelta)
            : twoPointersUsed.value
            ? _onMultiplePointersUpdate(details, cachedPrevScale, ref, context)
            : _onPointerMove(details, twoPointersUsed, ref, startCell.value, !isInputTouch),
        onScaleEnd: (details) {
          _onPointerUp(details, twoPointersUsed, ref);
          isSecondary.value = false;
        },

        onSecondaryTapDown: (details) => isSecondary.value = true,
        onSecondaryLongPressDown: (details) => isSecondary.value = true,

        onSecondaryTapUp: (details) => isSecondary.value = false,
        onSecondaryLongPressUp: () => isSecondary.value = false,
        onSecondaryLongPressEnd: (details) => isSecondary.value = false,
        onSecondaryLongPressCancel: () => isSecondary.value = false,

        child: Transform.translate(offset: gridOffset, child: Grid()),
      ),
    );
  }

  void _onTapUp(TapUpDetails details, WidgetRef ref) {
    ref.read(historyProvider.notifier).push();
  }

  void _onPointerDown(
    Offset localPoint,
    int pointerCount,
    ValueNotifier<bool> twoPointersUsed,
    ValueNotifier<(int, int)> startingCell,
    ValueNotifier<bool> isSecondary,
    WidgetRef ref,
  ) {
    Offset gridOffset = ref.watch(canvasOffsetProvider);
    final ToolType tool = ref.watch(toolProvider).activeTool;
    final int activeSwatchIndex = ref.read(paletteProvider).activeSwatchIndex;
    CanvasModel canvasModel = ref.read(canvasProvider);
    PanDataModel panDataModel = ref.read(panDataProvider);

    final (int, int) cell = canvasModel.getCellFromOffset(localPoint - gridOffset);
    if (!canvasModel.gridInfo.isCellWithinCanvas(cell)) return;

    startingCell.value = cell;

    if (pointerCount > 1) twoPointersUsed.value = true;
    if (twoPointersUsed.value) return;
    if (isSecondary.value) return;

    switch (tool) {
      case ToolType.brush:
        _drawPixel(cell, activeSwatchIndex, ref);
      case ToolType.line:
        PatternModel pattern = _getLine(startingCell.value, cell, activeSwatchIndex, ref);
        ref.read(canvasProvider.notifier).update(phantomPixels: pattern);
      case ToolType.square:
        PatternModel pattern = _getSquare(startingCell.value, cell, activeSwatchIndex, ref);
        ref.read(canvasProvider.notifier).update(phantomPixels: pattern);
      case ToolType.select:
        ref.read(gridSelectionProvider.notifier).set(_getSelection(startingCell.value, cell, ref));
      case ToolType.stamp:
        if (ref.read(stampProvider).pixelMap.isEmpty) {
          ref.read(gridSelectionProvider.notifier).set(_getSelection(startingCell.value, cell, ref));
        } else {
          _drawStamp(Offset(cell.$1.toDouble(), cell.$2.toDouble()), ref);
        }
      case ToolType.fill:
        ref.read(patternProvider.notifier).floodFill(canvasModel.getCellFromOffset(localPoint - gridOffset));
      case ToolType.pan:
        if (panDataModel.pattern != null) {
          PatternModel panSelectionPattern = ref.read(panDataProvider).pattern!;
          ref.read(patternProvider.notifier).remove(panSelectionPattern);
          ref.read(gridSelectionProvider.notifier).set(GridSelectionModel());
        }
      case ToolType.reference:
        ref.read(referencesProvider.notifier).cacheReferenceData(localPoint);
    }
  }

  void _onPointerMove(
    ScaleUpdateDetails details,
    ValueNotifier<bool> twoPointersUsed,
    WidgetRef ref,
    (int, int) startingCell,
    bool isDesktop,
  ) {
    CanvasModel canvasModel = ref.read(canvasProvider);
    ToolModel toolModel = ref.watch(toolProvider);
    ToolType tool = toolModel.activeTool;
    ReferenceType referenceType = toolModel.activeReferenceTool;
    // bool isDesktop = (Platform.isWindows || Platform.isLinux || Platform.isMacOS);

    Offset canvasOffset = ref.watch(canvasOffsetProvider);
    final int activeSwatchIndex = ref.read(paletteProvider).activeSwatchIndex;
    PanDataModel panDataModel = ref.read(panDataProvider);
    final (int, int) cell = canvasModel.getCellFromOffset(details.localFocalPoint - canvasOffset);
    switch (tool) {
      case ToolType.brush:
        _drawPixel(cell, activeSwatchIndex, ref);
      case ToolType.line:
        PatternModel pattern = _getLine(startingCell, cell, activeSwatchIndex, ref);
        ref.read(canvasProvider.notifier).update(phantomPixels: pattern);
      case ToolType.square:
        PatternModel pattern = _getSquare(startingCell, cell, activeSwatchIndex, ref);
        ref.read(canvasProvider.notifier).update(phantomPixels: pattern);
      case ToolType.reference:
        if (isDesktop && referenceType != ReferenceType.move) _setReferencePoints(details.localFocalPoint, ref);
        if (referenceType == ReferenceType.move && isDesktop) _panReference(details.focalPointDelta, ref);
        if (referenceType == ReferenceType.rotate && isDesktop) _rotateReference(details.localFocalPoint, ref);
        if (referenceType == ReferenceType.scale && isDesktop) _scaleReference(details.localFocalPoint, ref);
      case ToolType.select:
        ref.read(gridSelectionProvider.notifier).set(_getSelection(startingCell, cell, ref));
        break;
      case ToolType.stamp:
        if (ref.read(stampProvider).pixelMap.isEmpty) {
          ref.read(gridSelectionProvider.notifier).set(_getSelection(startingCell, cell, ref));
        }
      case ToolType.pan:
        if (panDataModel.pattern == null) {
          GridSelectionModel gridSelectionModel = _getSelection(startingCell, cell, ref);
          ref.read(gridSelectionProvider.notifier).set(gridSelectionModel);
        } else {
          int dx = cell.$1 - startingCell.$1;
          int dy = cell.$2 - startingCell.$2;
          ref.read(panDataProvider.notifier).set(panDataModel.copyWith(dx: dx, dy: dy));
        }
      default:
    }
  }

  void _onPointerUp(ScaleEndDetails details, ValueNotifier<bool> twoPointersUsed, WidgetRef ref) {
    ToolType tool = ref.watch(toolProvider).activeTool;
    PanDataModel panDataModel = ref.watch(panDataProvider);
    switch (tool) {
      case ToolType.line:
        _setPhantomPixels(ref);
      case ToolType.square:
        _setPhantomPixels(ref);
      case ToolType.reference:
        ref.read(referencesProvider.notifier).saveToDisk();
        ref.read(referencePointsProvider.notifier).clear();
      case ToolType.stamp:
        if (ref.read(stampProvider).pixelMap.isEmpty) {
          _setStampPixels(ref);
          ref.read(gridSelectionProvider.notifier).set(GridSelectionModel());
        }
      case ToolType.pan:
        if (panDataModel.pattern == null) {
          PatternModel pattern = ref.watch(patternProvider);
          PatternModel selectedPattern = PatternModel(pixelMap: {});
          GridSelectionModel gridSelectionModel = ref.read(gridSelectionProvider);
          for (int i = gridSelectionModel.startPixel.column; i < gridSelectionModel.endPixel.column + 1; i++) {
            for (int j = gridSelectionModel.startPixel.row; j < gridSelectionModel.endPixel.row + 1; j++) {
              PixelModel statePixel = pattern.pixelMap[(i, j).toString()] ?? PixelModel();
              if (statePixel.mySwatchIndex == 0) continue;
              PixelModel pixel = PixelModel(column: i, row: j, mySwatchIndex: statePixel.mySwatchIndex);
              selectedPattern.pixelMap[(i, j).toString()] = pixel;
            }
          }
          ref.read(panDataProvider.notifier).set(panDataModel.copyWith(pattern: selectedPattern));
        } else {
          PatternModel panSelectionPattern = ref.read(panDataProvider).pattern ?? PatternModel();
          ref
              .read(patternProvider.notifier)
              .add(panSelectionPattern.shifted(Offset(panDataModel.dx.toDouble(), panDataModel.dy.toDouble())));
          ref.read(panDataProvider.notifier).set(PanDataModel());
        }
      default:
    }
    if (details.pointerCount < 1) twoPointersUsed.value = false;
    ref.read(canvasProvider.notifier).update(phantomPixels: PatternModel());
    ref.read(historyProvider.notifier).push();
    ref.read(userProvider.notifier).save();
  }

  void _onMultiplePointersUpdate(
    ScaleUpdateDetails details,
    ValueNotifier<double> cachedPrevScale,
    WidgetRef ref,
    BuildContext context,
  ) {
    if (ref.read(toolProvider).activeTool == ToolType.reference) {
      ref.read(referencesProvider.notifier).panActiveReference(details.focalPointDelta);
      ref.read(referencesProvider.notifier).rotateActiveReferenceRaw(details.rotation);
      ref.read(referencesProvider.notifier).scaleActiveReferenceRaw(details.scale);
    } else {
      _mobileZoom(details, ref, cachedPrevScale, context);
    }
  }

  void _drawPixel((int, int) cell, int activeSwatchIndex, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    PatternModel pattern = PatternModel(pixelMap: {});

    for (int i = cell.$1 - canvasModel.toolInfo.brushSize; i < cell.$1 + canvasModel.toolInfo.brushSize + 1; i++) {
      for (int j = cell.$2 - canvasModel.toolInfo.brushSize; j < cell.$2 + canvasModel.toolInfo.brushSize + 1; j++) {
        if (!ref.read(canvasProvider).gridInfo.isCellWithinCanvas((i, j))) continue;
        final PixelModel pixel = PixelModel(column: i, row: j, mySwatchIndex: activeSwatchIndex);
        pattern.pixelMap[(i, j).toString()] = pixel;
      }
    }
    pattern = _getSymmetries(pattern, ref);

    HardwareKeyboard.instance.isShiftPressed || ref.read(canvasProvider).toolInfo.isEraserSet
        ? ref.read(patternProvider.notifier).remove(pattern)
        : ref.read(patternProvider.notifier).add(pattern);
  }

  void _drawStamp(Offset shift, WidgetRef ref) {
    PatternModel patternModel = ref.read(stampProvider);
    PatternModel shiftedModel = patternModel.shifted(shift);
    ref.read(patternProvider.notifier).add(shiftedModel);
  }

  void _setPhantomPixels(WidgetRef ref) {
    PatternModel phantomPixels = ref.read(canvasProvider).phantomPixels;
    HardwareKeyboard.instance.isShiftPressed || ref.read(canvasProvider).toolInfo.isEraserSet
        ? ref.read(patternProvider.notifier).remove(phantomPixels)
        : ref.read(patternProvider.notifier).add(phantomPixels);
  }

  void _setStampPixels(WidgetRef ref) {
    GridSelectionModel gridSelectionModel = ref.read(gridSelectionProvider);
    PatternModel patternModel = ref.read(patternProvider);
    PatternModel stampPattern = PatternModel(pixelMap: {});
    for (int i = gridSelectionModel.startPixel.column; i <= gridSelectionModel.endPixel.column; i++) {
      for (int j = gridSelectionModel.startPixel.row; j <= gridSelectionModel.endPixel.row; j++) {
        (int, int) cell = (i, j);
        if (!patternModel.pixelMap.containsKey(cell.toString())) continue;
        (int, int) adjustedCell = (
          cell.$1 - gridSelectionModel.startPixel.column,
          cell.$2 - gridSelectionModel.startPixel.row,
        );
        PixelModel pixel = PixelModel(
          column: adjustedCell.$1,
          row: adjustedCell.$2,
          mySwatchIndex: patternModel.pixelMap[cell.toString()]!.mySwatchIndex,
        );
        stampPattern.pixelMap[cell.toString()] = pixel;
      }
    }
    ref.read(stampProvider.notifier).set(stampPattern);
  }

  PatternModel _getSymmetries(PatternModel startModel, WidgetRef ref) {
    CanvasModel canvas = ref.read(canvasProvider);
    if (!canvas.symmetryHorizontal && !canvas.symmetryVertical) return startModel;

    PatternModel pattern = PatternModel(pixelMap: {});
    for (PixelModel pixel in startModel.pixelMap.values) {
      if (canvas.symmetryHorizontal) {
        (int, int) newCell = (canvas.gridInfo.columns - 1 - pixel.column, pixel.row);
        PixelModel newPixel = PixelModel(column: newCell.$1, row: newCell.$2, mySwatchIndex: pixel.mySwatchIndex);

        pattern.pixelMap[newCell.toString()] = newPixel;
      }

      if (canvas.symmetryVertical) {
        (int, int) newCell = (pixel.column, canvas.gridInfo.rows - 1 - pixel.row);
        PixelModel newPixel = PixelModel(column: newCell.$1, row: newCell.$2, mySwatchIndex: pixel.mySwatchIndex);
        pattern.pixelMap[newCell.toString()] = newPixel;
      }

      if (canvas.symmetryHorizontal && canvas.symmetryVertical) {
        (int, int) newCell = (canvas.gridInfo.columns - 1 - pixel.column, canvas.gridInfo.rows - 1 - pixel.row);
        PixelModel newPixel = PixelModel(column: newCell.$1, row: newCell.$2, mySwatchIndex: pixel.mySwatchIndex);
        pattern.pixelMap[newCell.toString()] = newPixel;
      }
    }

    return startModel + pattern;
  }

  PatternModel _getLine((int, int) startCell, (int, int) endCell, int activeSwatchIndex, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    int brushSize = canvasModel.toolInfo.brushSize;
    int delta = canvasModel.toolInfo.lineMode == LineMode.simple ? 0 : (canvasModel.toolInfo.brushSize + 1);
    PatternModel pattern = PatternModel(pixelMap: {});
    int deltaCounter = 1;

    int x0 = startCell.$2;
    int y0 = startCell.$1;
    int x1 = endCell.$2;
    int y1 = endCell.$1;

    int dx = (x1 - x0).abs();
    int sx = x0 < x1 ? 1 : -1;
    int dy = -(y1 - y0).abs();
    int sy = y0 < y1 ? 1 : -1;
    int error = dx + dy;

    int counter = 0;
    while (counter < 50) {
      (int, int) cell = (y0, x0);
      if (canvasModel.gridInfo.isCellWithinCanvas(cell)) {
        deltaCounter--;

        if (deltaCounter == 0 || delta == 0) {
          for (
            int i = cell.$1 - canvasModel.toolInfo.brushSize;
            i < cell.$1 + canvasModel.toolInfo.brushSize + 1;
            i++
          ) {
            for (
              int j = cell.$2 - canvasModel.toolInfo.brushSize;
              j < cell.$2 + canvasModel.toolInfo.brushSize + 1;
              j++
            ) {
              PixelModel newPixel = PixelModel(row: j, column: i, mySwatchIndex: activeSwatchIndex);
              pattern.pixelMap[(i, j).toString()] = newPixel;
              deltaCounter = (delta + 1) + (brushSize * 2);
            }
          }
        }
      }
      int e2 = 2 * error;
      if (e2 >= dy) {
        if (x0 == x1) break;
        error += dy;
        x0 += sx;
      }
      if (e2 <= dx) {
        if (y0 == y1) break;
        error += dx;
        y0 += sy;
      }
    }

    pattern = _getSymmetries(pattern, ref);
    return pattern;
  }

  GridSelectionModel _getSelection((int, int) startCell, (int, int) endCell, WidgetRef ref) {
    int x0 = min(startCell.$1, endCell.$1);
    int y0 = min(startCell.$2, endCell.$2);
    int x1 = max(startCell.$1, endCell.$1);
    int y1 = max(startCell.$2, endCell.$2);
    PixelModel startPixel = PixelModel(column: x0, row: y0);
    PixelModel endPixel = PixelModel(column: x1, row: y1);
    GridSelectionModel gridSelectionModel = GridSelectionModel(
      startPixel: startPixel,
      endPixel: endPixel,
      isActive: true,
    );
    return gridSelectionModel;
  }

  PatternModel _getSquare((int, int) startCell, (int, int) endCell, int activeSwatchIndex, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    PatternModel pattern = PatternModel(pixelMap: {});

    int x0 = min(startCell.$1, endCell.$1).clamp(0, canvasModel.gridInfo.columns - 1).toInt();
    int y0 = min(startCell.$2, endCell.$2).clamp(0, canvasModel.gridInfo.rows - 1).toInt();
    int x1 = max(startCell.$1, endCell.$1).clamp(0, canvasModel.gridInfo.columns - 1).toInt();
    int y1 = max(startCell.$2, endCell.$2).clamp(0, canvasModel.gridInfo.rows - 1).toInt();

    SquareMode squareMode = ref.read(canvasProvider).toolInfo.squareMode;
    switch (squareMode) {
      case SquareMode.outline:
        for (int i = x0; i <= x1; i++) {
          PixelModel newPixelA = PixelModel(column: i, row: y0, mySwatchIndex: activeSwatchIndex);
          PixelModel newPixelB = PixelModel(column: i, row: y1, mySwatchIndex: activeSwatchIndex);
          pattern.pixelMap[(i, y0).toString()] = newPixelA;
          pattern.pixelMap[(i, y1).toString()] = newPixelB;
        }
        for (int i = y0; i <= y1; i++) {
          PixelModel newPixelA = PixelModel(column: x0, row: i, mySwatchIndex: activeSwatchIndex);
          PixelModel newPixelB = PixelModel(column: x1, row: i, mySwatchIndex: activeSwatchIndex);
          pattern.pixelMap[(x0, i).toString()] = newPixelA;
          pattern.pixelMap[(x1, i).toString()] = newPixelB;
        }
      case SquareMode.filled:
        for (int i = x0; i <= x1; i++) {
          for (int j = y0; j <= y1; j++) {
            PixelModel newPixel = PixelModel(column: i, row: j, mySwatchIndex: activeSwatchIndex);
            pattern.pixelMap[(i, j).toString()] = newPixel;
          }
        }
      case SquareMode.checker:
        for (int i = x0; i <= x1; i++) {
          for (int j = y0; j <= y1; j++) {
            int c = 1;
            if ((i % 2 == c && j % 2 != c) || (i % 2 != c && j % 2 == c)) continue;
            PixelModel newPixel = PixelModel(column: i, row: j, mySwatchIndex: activeSwatchIndex);
            pattern.pixelMap[(i, j).toString()] = newPixel;
          }
        }
    }

    pattern = _getSymmetries(pattern, ref);
    return pattern;
  }

  void _panReference(Offset delta, WidgetRef ref) {
    ref.read(referencesProvider.notifier).panActiveReference(delta);
  }

  void _scaleReference(Offset localPosition, WidgetRef ref) {
    _setReferencePoints(localPosition, ref);
    ref.read(referencesProvider.notifier).scaleActiveReference(localPosition);
  }

  void _rotateReference(Offset localPosition, WidgetRef ref) {
    _setReferencePoints(localPosition, ref);
    ref.read(referencesProvider.notifier).rotateActiveReference(localPosition);
  }

  void _setReferencePoints(Offset pointerPos, WidgetRef ref) {
    ReferencesModel referencesModel = ref.watch(referencesProvider);
    if (referencesModel.references.isEmpty) return;
    ReferenceModel activeReference = referencesModel.references[ref.read(referencesProvider).activeIndex];
    CanvasModel canvasModel = ref.read(canvasProvider);
    ref.read(referencePointsProvider.notifier).set([
      Offset(
        activeReference.posX * canvasModel.zoomInfo.zoomValue,
        activeReference.posY * canvasModel.zoomInfo.zoomValue,
      ),
      pointerPos,
    ]);
  }

  void _mobileZoom(
    ScaleUpdateDetails details,
    WidgetRef ref,
    ValueNotifier<double> cachedPrevScale,
    BuildContext context,
  ) {
    double delta = details.scale - cachedPrevScale.value;
    cachedPrevScale.value = details.scale;

    ref.read(canvasOffsetProvider.notifier).add(details.focalPointDelta);
    if (details.scale == 1.0) return;
    if (details.pointerCount < 2) return;

    ref.read(canvasProvider.notifier).zoomRange(delta);
    adjustOffsetForZoom(context, details.focalPoint, delta, ref);
  }

  void adjustOffsetForZoom(BuildContext context, Offset localPoint, double delta, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    Offset halfSize = Offset(size.width * 0.5, size.height * 0.5);
    Offset canvasOffset = ref.read(canvasOffsetProvider) + halfSize;
    CanvasModel canvasModel = ref.watch(canvasProvider);
    if (canvasModel.zoomInfo.zoomValue >= 1.5 || canvasModel.zoomInfo.zoomValue <= 0.2) return;
    Offset difference = (canvasOffset - localPoint) * delta / canvasModel.zoomInfo.zoomValue;
    ref.read(canvasOffsetProvider.notifier).add(difference);
  }
}
