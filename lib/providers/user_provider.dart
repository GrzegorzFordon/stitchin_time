import 'dart:convert';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:stitchin_time/models/project_model.dart';
import 'package:stitchin_time/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/providers/project_provider.dart';
import 'package:uuid/uuid.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  Future<UserModel> build() async {
    state = AsyncValue.loading();
    UserModel model = await load();
    return model;
  }

  Future<UserModel> load() async {
    Box box = Hive.box("UserData");
    // await box.clear();
    if (box.isEmpty) _createNewData();
    String data = box.get("data");
    var decodedData = json.decode(data);
    UserModel model = UserModel.fromJson(decodedData);
    return model;
  }

  void save() {
    ProjectModel activeProject = ref.read(projectProvider);
    String uuid = activeProject.uuid;
    Map<String, ProjectModel> newMap = Map.from(state.value!.projects);
    newMap[uuid] = activeProject;
    UserModel userModel = UserModel(projects: newMap);
    state = AsyncValue.data(userModel);
    _saveToDisk();
  }

  // bool hasUnsavedData() {
  //   ProjectModel activeProject = ref.read(projectProvider);
  //   bool isDataDifferent = state.value!.projects[activeProject.uuid] != activeProject;
  //   return isDataDifferent;
  // }

  void overWriteActiveProject() {
    ProjectModel activeProject = ref.read(projectProvider);
    String uuid = activeProject.uuid;
    Map<String, ProjectModel> newMap = Map.from(state.value!.projects);
    newMap[uuid] = activeProject;
    UserModel userModel = UserModel(projects: newMap);
    state = AsyncValue.data(userModel);
    _saveToDisk();
  }

  void createNewProject() {
    Map<String, ProjectModel> newMap = Map.from(state.value!.projects);
    String uuid = Uuid().v4();
    ProjectModel newProject = ProjectModel(uuid: uuid, title: "New Project");
    newMap[uuid] = newProject;
    UserModel userModel = UserModel(projects: newMap);
    state = AsyncValue.data(userModel);
    _saveToDisk();
    ref.read(projectProvider.notifier).load(newProject);
  }

  void cloneProject(ProjectModel project) {
    Map<String, ProjectModel> newMap = Map.from(state.value!.projects);
    String uuid = Uuid().v4();
    ProjectModel newProject = ProjectModel(
      uuid: uuid,
      title: "${project.title} (clone)",
      canvas: project.canvas,
      palette: project.palette,
      pattern: project.pattern,
      // references: project.references,
      view: project.view,
    );
    newMap[uuid] = newProject;
    UserModel userModel = UserModel(projects: newMap);
    state = AsyncValue.data(userModel);
    _saveToDisk();
    ref.read(projectProvider.notifier).load(newProject);
  }

  void deleteProject(String uuid) {
    Map<String, ProjectModel> newMap = Map.from(state.value!.projects);
    newMap.remove(uuid);
    state = AsyncValue.data(state.value!.copyWith(projects: newMap));
    _saveToDisk();
  }

  void _saveToDisk() {
    String data = json.encode(state.value!);
    Box box = Hive.box("UserData");
    box.put("data", data);
  }

  void _createNewData() {
    Box box = Hive.box("UserData");
    UserModel newModel = UserModel();
    String data = json.encode(newModel);
    box.put("data", data);
  }

  void clearAllData() {
    Box box = Hive.box("UserData");
    box.clear();
    _createNewData();
    state = AsyncValue.data(UserModel());
    _saveToDisk();
  }
}
