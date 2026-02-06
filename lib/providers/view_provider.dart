import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/zoom_info_model.dart';
import 'package:stitchin_time/models/view_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/project_provider.dart';
import 'package:stitchin_time/providers/user_provider.dart';

part 'view_provider.g.dart';

@riverpod
class View extends _$View {
  @override
  ViewModel build() => ref.watch(projectProvider).view;

  void update({
    int? activeColumn,
    int? activeRow,
    int? maxBlockLength,
    int? rowRepeats,
    int? currentRepeat,
    ZoomInfoModel? zoomInfo,
    bool? showSettings,
  }) {
    CanvasModel canvasModel = ref.read(canvasProvider);
    state = state.copyWith(
      activeCol: activeColumn != null
          ? activeColumn.clamp(0, canvasModel.gridInfo.columns - 1).toInt()
          : state.activeCol,
      activeRow: activeRow != null ? activeRow.clamp(0, canvasModel.gridInfo.rows - 1).toInt() : state.activeRow,
      maxBlockLength: maxBlockLength ?? state.maxBlockLength,
      rowRepeats: rowRepeats != null ? rowRepeats.clamp(0, 10) : state.rowRepeats,
      currentRepeat: currentRepeat != null ? currentRepeat.clamp(1, 10) : state.currentRepeat,
      zoomInfo: zoomInfo ?? state.zoomInfo,
      showSettings: showSettings ?? state.showSettings,
    );
    ref.read(projectProvider.notifier).updateProject(view: state);
    if (zoomInfo == null) ref.read(userProvider.notifier).save();
  }

  void zoom(double delta) {
    var newZoom = state.zoomInfo.zoomValue + delta;
    newZoom = newZoom.clamp(0.1, 2.0);
    update(zoomInfo: state.zoomInfo.copyWith(zoomValue: newZoom));
  }

  void zoomStepped(int step) {
    int newZoomIndex = (state.zoomInfo.zoomIndexDiscrete + step).clamp(0, state.zoomInfo.zoomStepsDiscrete.length);
    double newZoom = state.zoomInfo.zoomStepsDiscrete[newZoomIndex];
    update(
      zoomInfo: state.zoomInfo.copyWith(zoomIndexDiscrete: newZoomIndex, zoomValue: newZoom),
    );
  }

  void stepRow(int step) => update(activeRow: state.activeRow + step, activeColumn: 0, currentRepeat: 1);

  void resetCol() => update(activeColumn: 0);

  void toggleSettings() => update(showSettings: !state.showSettings);

  bool isLast() => state.activeRow == ref.read(canvasProvider).gridInfo.rows;
}
