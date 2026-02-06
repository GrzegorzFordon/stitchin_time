// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToolModel _$ToolModelFromJson(Map<String, dynamic> json) => _ToolModel(
  activeTool:
      $enumDecodeNullable(_$ToolTypeEnumMap, json['activeTool']) ??
      ToolType.brush,
  activeReferenceTool:
      $enumDecodeNullable(
        _$ReferenceTypeEnumMap,
        json['activeReferenceTool'],
      ) ??
      ReferenceType.move,
);

Map<String, dynamic> _$ToolModelToJson(
  _ToolModel instance,
) => <String, dynamic>{
  'activeTool': _$ToolTypeEnumMap[instance.activeTool]!,
  'activeReferenceTool': _$ReferenceTypeEnumMap[instance.activeReferenceTool]!,
};

const _$ToolTypeEnumMap = {
  ToolType.brush: 'brush',
  ToolType.line: 'line',
  ToolType.square: 'square',
  ToolType.reference: 'reference',
  ToolType.select: 'select',
  ToolType.stamp: 'stamp',
  ToolType.fill: 'fill',
  ToolType.pan: 'pan',
};

const _$ReferenceTypeEnumMap = {
  ReferenceType.move: 'move',
  ReferenceType.rotate: 'rotate',
  ReferenceType.scale: 'scale',
};
