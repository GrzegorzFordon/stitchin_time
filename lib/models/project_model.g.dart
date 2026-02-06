// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) =>
    _ProjectModel(
      title: json['title'] as String? ?? "New Project",
      uuid: json['uuid'] as String? ?? "defaultValue",
      pattern: json['pattern'] == null
          ? const PatternModel()
          : PatternModel.fromJson(json['pattern'] as Map<String, dynamic>),
      canvas: json['canvas'] == null
          ? const CanvasModel()
          : CanvasModel.fromJson(json['canvas'] as Map<String, dynamic>),
      palette: json['palette'] == null
          ? const PaletteModel()
          : PaletteModel.fromJson(json['palette'] as Map<String, dynamic>),
      view: json['view'] == null
          ? const ViewModel()
          : ViewModel.fromJson(json['view'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectModelToJson(_ProjectModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'uuid': instance.uuid,
      'pattern': instance.pattern,
      'canvas': instance.canvas,
      'palette': instance.palette,
      'view': instance.view,
    };
