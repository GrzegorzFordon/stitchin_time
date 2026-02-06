
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/grid_selection_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/pixel_model.dart';
import 'package:stitchin_time/models/view_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/pattern_provider.dart';
import 'package:stitchin_time/providers/view_provider.dart';
import 'package:stitchin_time/extensions/extensions.dart';

part 'chart_block_provider.g.dart';

@riverpod
class ChartBlock extends _$ChartBlock {
  @override
  GridSelectionModel build() {
    ViewModel viewModel = ref.watch(viewProvider);
    return getModel(viewModel: viewModel);
  }

  GridSelectionModel getModel({required ViewModel viewModel}) {
    CanvasModel canvasModel = ref.read(canvasProvider);
    PatternModel patternModel = ref.read(patternProvider);
    (int, int) startingCell = (viewModel.activeCol, viewModel.activeRow);
    (int, int) endCell = (viewModel.activeCol, viewModel.activeRow);
    PixelModel? pixel =
        patternModel.pixelMap[((canvasModel.gridInfo.columns - 1, canvasModel.gridInfo.rows - 1) -
                startingCell)
            .toString()];
    int startingCellSwatchIndex = (pixel != null ? pixel.mySwatchIndex : 0);
    int counter = 0;
    while (canvasModel.gridInfo.isCellWithinCanvas(
          ((canvasModel.gridInfo.columns - 1, canvasModel.gridInfo.rows - 1) - endCell),
        ) &&
        counter < viewModel.maxBlockLength) {
      counter++;
      PixelModel? pixel =
          patternModel.pixelMap[((
                    canvasModel.gridInfo.columns - 1,
                    canvasModel.gridInfo.rows - 1,
                  ) -
                  endCell)
              .toString()];
      int activePixelSwatchIndex = pixel != null ? pixel.mySwatchIndex : 0;
      bool sameSwatchIndex = activePixelSwatchIndex == startingCellSwatchIndex;
      if (!sameSwatchIndex) break;
      endCell += (1, 0);
    }

    PixelModel startPixel = PixelModel(
      column: startingCell.$1,
      row: startingCell.$2,
      mySwatchIndex: startingCellSwatchIndex,
    );
    PixelModel endPixel = PixelModel(
      column: endCell.$1 - 1,
      row: endCell.$2,
      mySwatchIndex: startingCellSwatchIndex,
    );
    GridSelectionModel model = GridSelectionModel(
      startPixel: startPixel,
      endPixel: endPixel,
      isActive: true,
    );
    return model;
  }

  void advance() {
    ViewModel viewModel = ref.read(viewProvider);
    bool isAtRowEnd =
        state.endPixel.column + 1 >= ref.read(canvasProvider).gridInfo.columns;

    bool isDoneWithRepeats = viewModel.currentRepeat == viewModel.rowRepeats;

    var rowStep = isAtRowEnd && isDoneWithRepeats ? 1 : 0;
    var col = isAtRowEnd ? 0 : state.endPixel.column + 1;

    if (isAtRowEnd) {
      ref
          .read(viewProvider.notifier)
          .update(
            currentRepeat: isDoneWithRepeats ? 1 : viewModel.currentRepeat + 1,
          );
    }

    ref
        .read(viewProvider.notifier)
        .update(activeColumn: col, activeRow: viewModel.activeRow + rowStep);

    state = getModel(viewModel: viewModel);
  }

  void reset() {
    ref
        .read(viewProvider.notifier)
        .update(activeColumn: 0, activeRow: 0, currentRepeat: 1);
    state = getModel(viewModel: ref.read(viewProvider));
  }
}
