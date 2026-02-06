import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' hide log;
import 'package:conversion/conversion.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/reference_model.dart';
import 'package:stitchin_time/models/references_model.dart';
import 'package:stitchin_time/models/tool_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/project_provider.dart';
import 'package:stitchin_time/providers/tool_provider.dart';

part 'references_provider.g.dart';

@Riverpod(keepAlive: true)
class References extends _$References {
  @override
  ReferencesModel build() {
    return ReferencesModel();
  }

  void load(String projectID) {
    Box box = Hive.box("UserData");
    if (!box.containsKey("references")) _createNewData();
    String data = box.get("references");
    Map<String, dynamic> decodedData = json.decode(data);
    var model = decodedData.containsKey(projectID)
        ? ReferencesModel.fromJson(decodedData[projectID])
        : ReferencesModel(uuid: projectID);
    state = model;
  }

  void setActiveIndex(int index) {
    state = state.copyWith(activeIndex: index);
    ref.read(projectProvider.notifier).updateProject(references: state);
  }

  void openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: "Pick a reference!",
      type: FileType.image,
      // withData: false,
    );
    if (result == null) return;
    if (kIsWeb) {
      var webFile = result.files.first;
      addReference(webFile.bytes!);
    } else {
      File file = File(result.files.first.path!);
      // addReference(file);
      addReference(await file.readAsBytes());
    }
  }

  Future<void> addReference(Uint8List bytes) async {
    CanvasModel canvasModel = ref.read(canvasProvider);

    final String base64data = base64.encode(bytes);
    ReferenceModel newReference = ReferenceModel(
      posX: canvasModel.gridInfo.getWidth() * 0.5,
      posY: canvasModel.gridInfo.getHeight() * 0.5,
      base64encodedImageString: base64data,
    );
    ReferencesModel newModel = ReferencesModel(
      references: state.references.toList()..add(newReference),
      activeIndex: state.references.length,
    );
    state = newModel;
    saveToDisk();
  }

  Future<void> removeReference(index) async {
    ReferencesModel newModel = ReferencesModel(
      references: state.references.toList()..removeAt(index),
      activeIndex: state.activeIndex >= state.references.length - 1 ? state.activeIndex - 1 : state.activeIndex,
    );

    state = newModel;
    if (state.references.isEmpty) ref.read(toolProvider.notifier).set(ToolType.brush);
    saveToDisk();
  }

  Future<void> cacheImageData(ReferenceModel reference, int index) async {
    Uint8List bytes = base64Decode(reference.base64encodedImageString);
    var image = await decodeImageFromList(bytes);
    reference = reference.copyWith(refImg: image, bytes: bytes);
    state = state.copyWith(references: state.references.toList()..[index] = reference);
    // ref.read(projectProvider.notifier).updateProject(references: state);
  }

  void cacheReferenceData(Offset startOffset) {
    ReferenceModel referenceModel = ReferenceModel(posX: startOffset.dx, posY: startOffset.dy);
    if (state.references.isNotEmpty) {
      ReferenceModel activeReference = state.references[state.activeIndex];
      referenceModel = activeReference.copyWith(posX: startOffset.dx, posY: startOffset.dy);
    }
    state = state.copyWith(cachedRefData: referenceModel);
    // ref.read(projectProvider.notifier).updateProject(references: state);
  }

  void panActiveReference(Offset delta) {
    if (state.references.isEmpty) return;
    ReferenceModel referenceModel = state.references[state.activeIndex];
    CanvasModel canvasModel = ref.read(canvasProvider);
    double posX = referenceModel.posX + delta.dx / canvasModel.zoomInfo.zoomValue;
    double posY = referenceModel.posY + delta.dy / canvasModel.zoomInfo.zoomValue;
    _updateActiveReference(posX: posX, posY: posY);
  }

  void scaleActiveReference(Offset curPos) {
    if (state.references.isEmpty) return;
    double startScale = state.cachedRefData.scale;
    ReferenceModel referenceModel = state.references[state.activeIndex];
    CanvasModel canvasModel = ref.read(canvasProvider);

    final Offset imageOffset = Offset(
      referenceModel.posX * canvasModel.zoomInfo.zoomValue,
      referenceModel.posY * canvasModel.zoomInfo.zoomValue,
    );
    Offset startPos = Offset(state.cachedRefData.posX, state.cachedRefData.posY);
    final double distance = ((startPos - imageOffset).distanceSquared / (curPos - imageOffset).distanceSquared);
    final double newScale = (startScale * (distance));
    _updateActiveReference(scale: newScale.clamp(0.02, 50));
  }

  void scaleActiveReferenceRaw(double scale) {
    final double newScale = state.cachedRefData.scale / scale;
    _updateActiveReference(scale: newScale);
  }

  void rotateActiveReference(Offset curPos) {
    if (state.references.isEmpty) return;
    Offset startPos = Offset(state.cachedRefData.posX, state.cachedRefData.posY);
    double startRot = state.cachedRefData.rotAngle;

    ReferenceModel referenceModel = state.references[state.activeIndex];
    CanvasModel canvasModel = ref.read(canvasProvider);

    final Offset imageOffset = Offset(
      referenceModel.posX * canvasModel.zoomInfo.zoomValue,
      referenceModel.posY * canvasModel.zoomInfo.zoomValue,
    );

    double rotateDegreeBefore = atan2(startPos.dy - imageOffset.dy, startPos.dx - imageOffset.dx) / (pi / 180);
    double rotateDegreeAfter = atan2(curPos.dy - imageOffset.dy, curPos.dx - imageOffset.dx) / (pi / 180);
    double rotation = rotateDegreeAfter - rotateDegreeBefore;
    _updateActiveReference(rotAngle: startRot + rotation);
  }

  void rotateActiveReferenceRaw(double angle) {
    angle = Convert().radiansToDegree(radians: angle);
    _updateActiveReference(rotAngle: state.cachedRefData.rotAngle + angle);
  }

  void setOpacityReference(int index, double newValue) {
    double adjustedValue = pow(newValue, 2.5).toDouble();
    _updateActiveReference(opacity: adjustedValue, index: index);
  }

  void setOpacityReferenceDelta(int index, double delta) {
    double newValue = state.references[index].opacity + delta * 0.01;
    newValue = newValue.clamp(0.0, 1.0);
    _updateActiveReference(opacity: newValue);
  }

  void swapReferencePositions(int indexA, int indexB) {
    if (indexB < 0 || indexB >= state.references.length) return;
    var referenceList = state.references.toList();
    referenceList[indexA] = state.references[indexB];
    referenceList[indexB] = state.references[indexA];
    state = state.copyWith(references: referenceList, activeIndex: indexB);
    ref.read(projectProvider.notifier).updateProject(references: state);
  }

  void _updateActiveReference({
    double? posX,
    double? posY,
    double? scale,
    double? opacity,
    double? rotAngle,
    int? index,
  }) {
    if (state.references.isEmpty) return;
    ReferenceModel referenceModel = state.references[index ?? state.activeIndex];
    referenceModel = referenceModel.copyWith(
      posX: posX ?? referenceModel.posX,
      posY: posY ?? referenceModel.posY,
      scale: scale ?? referenceModel.scale,
      opacity: opacity ?? referenceModel.opacity,
      rotAngle: rotAngle ?? referenceModel.rotAngle,
    );
    List<ReferenceModel> referenceList = state.references.toList()..[index ?? state.activeIndex] = referenceModel;

    state = state.copyWith(references: referenceList);
  }

  void saveToDisk() {
    String projectID = ref.read(projectProvider).uuid;
    Box box = Hive.box("UserData");
    String data = box.get("references");
    Map<String, dynamic> decodedData = json.decode(data);
    decodedData[projectID] = state;
    data = json.encode(decodedData);
    box.put("references", data);
  }

  void deleteFromDisk(String projectID) async{
    Box box = Hive.box("UserData");
    String data = box.get("references");
    Map<String, dynamic> decodedData = json.decode(data);
    decodedData.remove(projectID);
    data = json.encode(decodedData);
    box.put("references", data);
  }

  void _createNewData() {
    Box box = Hive.box("UserData");
    Map<String, ReferencesModel> map = <String, ReferencesModel>{};
    String data = json.encode(map);
    box.put("references", data);
  }
}
