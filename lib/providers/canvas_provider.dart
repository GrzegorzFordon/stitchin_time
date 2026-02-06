import 'dart:math' hide log;
import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/grid_info_model.dart';
import 'package:stitchin_time/models/tool_info_model.dart';
import 'package:stitchin_time/models/zoom_info_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/project_model.dart';
import 'package:stitchin_time/providers/pattern_provider.dart';
import 'package:stitchin_time/providers/project_provider.dart';
import 'package:stitchin_time/providers/user_provider.dart';
part 'canvas_provider.g.dart';

@riverpod
class Canvas extends _$Canvas {
  @override
  CanvasModel build() {
    ProjectModel projectModel = ref.watch(projectProvider);
    return projectModel.canvas;
  }

  void update({
    bool? symmetryHorizontal,
    bool? symmetryVertical,
    PatternModel? phantomPixels,
    ToolInfoModel? toolInfo,
    GridInfoModel? gridInfo,
    ZoomInfoModel? zoomInfo,
    int? overpaintAmount,
    bool? showSettings,
  }) {
    state = state.copyWith(
      symmetryHorizontal: symmetryHorizontal ?? state.symmetryHorizontal,
      symmetryVertical: symmetryVertical ?? state.symmetryVertical,
      phantomPixels: phantomPixels ?? state.phantomPixels,
      toolInfo: toolInfo ?? state.toolInfo,
      gridInfo: gridInfo ?? state.gridInfo,
      zoomInfo: zoomInfo ?? state.zoomInfo,
      overpaintAmount: overpaintAmount != null ? overpaintAmount.clamp(0, 20) : state.overpaintAmount,
      showSettings: showSettings ?? state.showSettings,
    );
    ref.read(projectProvider.notifier).updateProject(canvas: state);
  }

  void zoomStepped(int step) {
    int newZoomIndex = (state.zoomInfo.zoomIndexDiscrete + step).clamp(0, state.zoomInfo.zoomStepsDiscrete.length-1);
    double newZoom = state.zoomInfo.zoomStepsDiscrete[newZoomIndex];
    update(
      zoomInfo: state.zoomInfo.copyWith(zoomIndexDiscrete: newZoomIndex, zoomValue: newZoom),
    );
  }

  void zoomRange(double value) {
    double newZoom = (state.zoomInfo.zoomValue + value).clamp(0.2, 2.0);
    update(zoomInfo: state.zoomInfo.copyWith(zoomValue: newZoom));
  }

  void setSize({bool isRow = false, int amount = 1}) {
    int dif = isRow ? amount - state.gridInfo.rows : amount - state.gridInfo.columns;
    if (isRow) {
      update(gridInfo: state.gridInfo.copyWith(rows: max(state.gridInfo.rows + dif, 0)));
    } else {
      update(gridInfo: state.gridInfo.copyWith(columns: max(state.gridInfo.columns + dif, 0)));
    }

    if (!state.gridInfo.isChangedAtEnd) {
      ref.read(patternProvider.notifier).shiftAll(Offset(isRow ? 0 : dif.toDouble(), isRow ? dif.toDouble() : 0));
    }
    ref.read(userProvider.notifier).save();
  }

  void toggleEraser() {
    update(toolInfo: state.toolInfo.copyWith(isEraserSet: !state.toolInfo.isEraserSet));
  }

  void toggleSettings() {
    update(showSettings: !state.showSettings);
  }
}
