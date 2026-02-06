// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToolInfoModel _$ToolInfoModelFromJson(Map<String, dynamic> json) =>
    _ToolInfoModel(
      lineMode:
          $enumDecodeNullable(_$LineModeEnumMap, json['lineMode']) ??
          LineMode.simple,
      squareMode:
          $enumDecodeNullable(_$SquareModeEnumMap, json['squareMode']) ??
          SquareMode.outline,
      brushSize: (json['brushSize'] as num?)?.toInt() ?? 0,
      lineDelta: (json['lineDelta'] as num?)?.toInt() ?? 0,
      isEraserSet: json['isEraserSet'] as bool? ?? false,
    );

Map<String, dynamic> _$ToolInfoModelToJson(_ToolInfoModel instance) =>
    <String, dynamic>{
      'lineMode': _$LineModeEnumMap[instance.lineMode]!,
      'squareMode': _$SquareModeEnumMap[instance.squareMode]!,
      'brushSize': instance.brushSize,
      'lineDelta': instance.lineDelta,
      'isEraserSet': instance.isEraserSet,
    };

const _$LineModeEnumMap = {
  LineMode.simple: 'simple',
  LineMode.dotted: 'dotted',
};

const _$SquareModeEnumMap = {
  SquareMode.outline: 'outline',
  SquareMode.filled: 'filled',
  SquareMode.checker: 'checker',
};
