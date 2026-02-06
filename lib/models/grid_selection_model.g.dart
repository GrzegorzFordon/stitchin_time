// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_selection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GridSelectionModel _$GridSelectionModelFromJson(Map<String, dynamic> json) =>
    _GridSelectionModel(
      startPixel: json['startPixel'] == null
          ? const PixelModel()
          : PixelModel.fromJson(json['startPixel'] as Map<String, dynamic>),
      endPixel: json['endPixel'] == null
          ? const PixelModel()
          : PixelModel.fromJson(json['endPixel'] as Map<String, dynamic>),
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$GridSelectionModelToJson(_GridSelectionModel instance) =>
    <String, dynamic>{
      'startPixel': instance.startPixel,
      'endPixel': instance.endPixel,
      'isActive': instance.isActive,
    };
