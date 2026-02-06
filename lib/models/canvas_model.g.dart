// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CanvasModel _$CanvasModelFromJson(Map<String, dynamic> json) => _CanvasModel(
  toolInfo: json['toolInfo'] == null
      ? const ToolInfoModel()
      : ToolInfoModel.fromJson(json['toolInfo'] as Map<String, dynamic>),
  gridInfo: json['gridInfo'] == null
      ? const GridInfoModel()
      : GridInfoModel.fromJson(json['gridInfo'] as Map<String, dynamic>),
  zoomInfo: json['zoomInfo'] == null
      ? const ZoomInfoModel()
      : ZoomInfoModel.fromJson(json['zoomInfo'] as Map<String, dynamic>),
  phantomPixels: json['phantomPixels'] == null
      ? const PatternModel()
      : PatternModel.fromJson(json['phantomPixels'] as Map<String, dynamic>),
  fontSize: (json['fontSize'] as num?)?.toDouble() ?? 0.3,
  symmetryHorizontal: json['symmetryHorizontal'] as bool? ?? false,
  symmetryVertical: json['symmetryVertical'] as bool? ?? false,
  overpaintAmount: (json['overpaintAmount'] as num?)?.toInt() ?? 0,
  showSettings: json['showSettings'] ?? false,
);

Map<String, dynamic> _$CanvasModelToJson(_CanvasModel instance) =>
    <String, dynamic>{
      'toolInfo': instance.toolInfo,
      'gridInfo': instance.gridInfo,
      'zoomInfo': instance.zoomInfo,
      'phantomPixels': instance.phantomPixels,
      'fontSize': instance.fontSize,
      'symmetryHorizontal': instance.symmetryHorizontal,
      'symmetryVertical': instance.symmetryVertical,
      'overpaintAmount': instance.overpaintAmount,
      'showSettings': instance.showSettings,
    };
