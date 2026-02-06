// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pan_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PanDataModel _$PanDataModelFromJson(Map<String, dynamic> json) =>
    _PanDataModel(
      pattern: json['pattern'] == null
          ? null
          : PatternModel.fromJson(json['pattern'] as Map<String, dynamic>),
      dx: (json['dx'] as num?)?.toInt() ?? 0,
      dy: (json['dy'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PanDataModelToJson(_PanDataModel instance) =>
    <String, dynamic>{
      'pattern': instance.pattern,
      'dx': instance.dx,
      'dy': instance.dy,
    };
