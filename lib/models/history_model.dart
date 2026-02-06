import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stitchin_time/models/project_model.dart';

part 'history_model.g.dart';
part 'history_model.freezed.dart';

@freezed
abstract class HistoryModel with _$HistoryModel {
  const factory HistoryModel({@Default([]) List<ProjectModel> undoList, @Default([]) List<ProjectModel> redoList}) =
      _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => _$HistoryModelFromJson(json);
}
