// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferenceModel _$ReferenceModelFromJson(Map<String, dynamic> json) =>
    _ReferenceModel(
      posX: (json['posX'] as num?)?.toDouble() ?? 0.0,
      posY: (json['posY'] as num?)?.toDouble() ?? 0.0,
      scale: (json['scale'] as num?)?.toDouble() ?? 1.0,
      opacity: (json['opacity'] as num?)?.toDouble() ?? 0.5,
      rotAngle: (json['rotAngle'] as num?)?.toDouble() ?? 0,
      base64encodedImageString:
          json['base64encodedImageString'] as String? ?? "",
      bytes: const BytesConverter().fromJson(json['bytes']),
      refImg: const ImageConverter().fromJson(json['refImg']),
    );

Map<String, dynamic> _$ReferenceModelToJson(_ReferenceModel instance) =>
    <String, dynamic>{
      'posX': instance.posX,
      'posY': instance.posY,
      'scale': instance.scale,
      'opacity': instance.opacity,
      'rotAngle': instance.rotAngle,
      'base64encodedImageString': instance.base64encodedImageString,
      'bytes': const BytesConverter().toJson(instance.bytes),
      'refImg': const ImageConverter().toJson(instance.refImg),
    };
