import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stitchin_time/models/grid_info_model.dart';
import 'package:stitchin_time/models/tool_info_model.dart';
import 'package:stitchin_time/models/zoom_info_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';

part 'canvas_model.g.dart';
part 'canvas_model.freezed.dart';

@freezed
abstract class CanvasModel with _$CanvasModel {
  const CanvasModel._();
  const factory CanvasModel({
    @Default(ToolInfoModel()) ToolInfoModel toolInfo,
    @Default(GridInfoModel()) GridInfoModel gridInfo,
    @Default(ZoomInfoModel()) ZoomInfoModel zoomInfo,
    @Default(PatternModel()) PatternModel phantomPixels,
    @Default(0.3) double fontSize,
    @Default(false) bool symmetryHorizontal,
    @Default(false) bool symmetryVertical,
    @Default(0) int overpaintAmount,
    @Default(false) showSettings,
  }) = _CanvasModel;

  (int, int) getCellFromOffset(Offset offset) {
    final int column = (offset.dx / (zoomInfo.zoomValue * gridInfo.cellWidth * gridInfo.getCellRatio())).floor();
    final int row = (offset.dy / zoomInfo.zoomValue / gridInfo.cellHeight).floor();
    return (column, row);
  }

  factory CanvasModel.fromJson(Map<String, dynamic> json) => _$CanvasModelFromJson(json);
}
