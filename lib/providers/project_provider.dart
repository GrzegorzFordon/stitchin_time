import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/palette_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/project_model.dart';
import 'package:stitchin_time/models/references_model.dart';
import 'package:stitchin_time/models/view_model.dart';
import 'package:stitchin_time/providers/app_state_provider.dart';
import 'package:stitchin_time/providers/history_provider.dart';
import 'package:stitchin_time/providers/references_provider.dart';
part 'project_provider.g.dart';

@Riverpod(keepAlive: true)
class Project extends _$Project {
  @override
  ProjectModel build() {
    return ProjectModel();
  }

  void load(ProjectModel model) {
    state = model;
    ref.read(appStateProvider.notifier).set(AppStateType.edit);
    ref.read(referencesProvider.notifier).load(model.uuid);
    ref.read(historyProvider.notifier).clear();
  }

  void updateProject({
    String? title,
    PatternModel? pattern,
    CanvasModel? canvas,
    PaletteModel? palette,
    ViewModel? view,
    ReferencesModel? references,
  }) {
    state = state.copyWith(
      title: title ?? state.title,
      pattern: pattern ?? state.pattern,
      canvas: canvas ?? state.canvas,
      palette: palette ?? state.palette,
      view: view ?? state.view,
      // references: references ?? state.references,
    );
  }
}
