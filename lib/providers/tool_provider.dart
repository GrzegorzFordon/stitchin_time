import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/grid_selection_model.dart';
import 'package:stitchin_time/models/pan_data_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/pixel_model.dart';
import 'package:stitchin_time/models/tool_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/grid_selection_provider.dart';
import 'package:stitchin_time/providers/pan_data_provider.dart';
import 'package:stitchin_time/providers/stamp_provider.dart';
part 'tool_provider.g.dart';

@riverpod
class Tool extends _$Tool {
  @override
  ToolModel build() => ToolModel();

  void set(ToolType newTool) {
    _updateSelection(newTool, ref);
    state = state.copyWith(activeTool: newTool);
  }

  void setReference(ReferenceType referenceType) {
    _updateSelection(ToolType.reference, ref);
    state = state.copyWith(activeTool: ToolType.reference, activeReferenceTool: referenceType);
  }
}

void _updateSelection(ToolType newTool, Ref ref) {
  if (newTool == ToolType.select) {
    CanvasModel canvasModel = ref.read(canvasProvider);
    ref
        .read(gridSelectionProvider.notifier)
        .set(
          GridSelectionModel(
            startPixel: PixelModel(column: 0, row: 0),
            endPixel: PixelModel(column: canvasModel.gridInfo.columns, row: canvasModel.gridInfo.rows),
            isActive: true,
          ),
        );
  } else {
    ref.read(gridSelectionProvider.notifier).set(GridSelectionModel());
  }

  if (newTool == ToolType.stamp) ref.read(stampProvider.notifier).set(PatternModel());

  if (newTool == ToolType.pan) ref.read(panDataProvider.notifier).set(PanDataModel());
}
