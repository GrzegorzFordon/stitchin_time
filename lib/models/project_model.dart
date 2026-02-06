import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/palette_model.dart';
import 'package:stitchin_time/models/pattern_model.dart';
import 'package:stitchin_time/models/references_model.dart';
import 'package:stitchin_time/models/view_model.dart';

part 'project_model.g.dart';
part 'project_model.freezed.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    @Default("New Project") String title,
    @Default("defaultValue") String uuid,
    @Default(PatternModel()) PatternModel pattern,
    @Default(CanvasModel()) CanvasModel canvas,
    @Default(PaletteModel()) PaletteModel palette,
    // @Default(ReferencesModel()) ReferencesModel references,
    @Default(ViewModel()) ViewModel view,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);
}
