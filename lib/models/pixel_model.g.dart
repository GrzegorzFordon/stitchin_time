// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PixelModel _$PixelModelFromJson(Map<String, dynamic> json) => _PixelModel(
  row: (json['row'] as num?)?.toInt() ?? -1,
  column: (json['column'] as num?)?.toInt() ?? -1,
  mySwatchIndex: json['mySwatchIndex'] ?? 0,
);

Map<String, dynamic> _$PixelModelToJson(_PixelModel instance) =>
    <String, dynamic>{
      'row': instance.row,
      'column': instance.column,
      'mySwatchIndex': instance.mySwatchIndex,
    };
