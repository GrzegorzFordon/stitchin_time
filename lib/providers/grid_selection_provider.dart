import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/grid_selection_model.dart';
import 'package:stitchin_time/models/pixel_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';

part 'grid_selection_provider.g.dart';

@riverpod
class GridSelection extends _$GridSelection {
  @override
  GridSelectionModel build() {
    return GridSelectionModel();
  }

  void set(GridSelectionModel model) {
    if(model == state) return;
    CanvasModel canvasModel = ref.read(canvasProvider);
    PixelModel clampedStartPixel = PixelModel(
      column: model.startPixel.column.clamp(0, canvasModel.gridInfo.columns).toInt(),
      row: model.startPixel.row.clamp(0, canvasModel.gridInfo.rows).toInt(),
    );
    PixelModel clampedEndPixel = PixelModel(
      column: model.endPixel.column.clamp(0, canvasModel.gridInfo.columns-1).toInt(),
      row: model.endPixel.row.clamp(0, canvasModel.gridInfo.rows-1).toInt(),
    );
    state = GridSelectionModel(
      startPixel: clampedStartPixel,
      endPixel: clampedEndPixel,
      isActive: model.isActive,
    );
  }

  void shift(Offset offset){
    PixelModel shiftedStartPixel = PixelModel(column: state.startPixel.column+offset.dx.toInt(),row: state.startPixel.row+offset.dy.toInt());
    PixelModel shiftedEndPixel = PixelModel(column: state.endPixel.column+offset.dx.toInt(),row: state.endPixel.row+offset.dy.toInt());
    state = GridSelectionModel(startPixel: shiftedStartPixel,endPixel: shiftedEndPixel,isActive: state.isActive);
  }
}
