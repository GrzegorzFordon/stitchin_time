// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pattern_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatternModel _$PatternModelFromJson(Map<String, dynamic> json) =>
    _PatternModel(
      pixelMap:
          (json['pixelMap'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, PixelModel.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$PatternModelToJson(_PatternModel instance) =>
    <String, dynamic>{'pixelMap': instance.pixelMap};
