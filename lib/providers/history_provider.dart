import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/history_model.dart';
import 'package:stitchin_time/models/project_model.dart';
import 'package:stitchin_time/providers/project_provider.dart';
import 'package:stitchin_time/providers/user_provider.dart';
part 'history_provider.g.dart';

@Riverpod(keepAlive: true)
class History extends _$History {
  @override
  HistoryModel build() {
    return HistoryModel();
  }

  void push() {
    ProjectModel currentProject = ref.read(projectProvider);
    bool patternsDiffer = state.undoList.isEmpty || currentProject.pattern != state.undoList.last.pattern;
    if (!patternsDiffer) return;
    List<ProjectModel> newList = List.from(state.undoList);
    newList.add(currentProject);
    if (newList.length > 21) newList.removeAt(0);
    state = state.copyWith(undoList: newList, redoList: []);
    ref.read(userProvider.notifier).save();
  }

  ProjectModel pop({bool undo = true}) {
    List<ProjectModel> newUndoList = List.from(state.undoList);
    List<ProjectModel> newRedoList = List.from(state.redoList);
    ProjectModel lastModel = undo ? newUndoList.removeLast() : newRedoList.removeLast();
    if (undo) {
      newRedoList.add(lastModel);
    } else {
      newUndoList.add(lastModel);
    }

    state = state.copyWith(undoList: newUndoList, redoList: newRedoList);
    ref.read(userProvider.notifier).save();
    return newUndoList.last;
  }

  void clear() {
    state = HistoryModel();
    push();
  }
}
