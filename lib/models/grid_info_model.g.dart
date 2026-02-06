// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GridInfoModel _$GridInfoModelFromJson(Map<String, dynamic> json) =>
    _GridInfoModel(
      rows: (json['rows'] as num?)?.toInt() ?? 20,
      columns: (json['columns'] as num?)?.toInt() ?? 20,
      cellWidth: (json['cellWidth'] as num?)?.toInt() ?? 30,
      cellHeight: (json['cellHeight'] as num?)?.toInt() ?? 30,
      cellWidthType:
          $enumDecodeNullable(_$CellWidthTypeEnumMap, json['cellWidthType']) ??
          CellWidthType.square,
      highlightDelta: (json['highlightDelta'] as num?)?.toInt() ?? 10,
      isChangedAtEnd: json['isChangedAtEnd'] as bool? ?? true,
    );

Map<String, dynamic> _$GridInfoModelToJson(_GridInfoModel instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'columns': instance.columns,
      'cellWidth': instance.cellWidth,
      'cellHeight': instance.cellHeight,
      'cellWidthType': _$CellWidthTypeEnumMap[instance.cellWidthType]!,
      'highlightDelta': instance.highlightDelta,
      'isChangedAtEnd': instance.isChangedAtEnd,
    };

const _$CellWidthTypeEnumMap = {
  CellWidthType.tall: 'tall',
  CellWidthType.square: 'square',
  CellWidthType.wide: 'wide',
};
