// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zoom_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ZoomInfoModel _$ZoomInfoModelFromJson(Map<String, dynamic> json) =>
    _ZoomInfoModel(
      zoomStepsDiscrete:
          (json['zoomStepsDiscrete'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [
            0.125,
            0.167,
            0.25,
            0.33,
            0.5,
            0.66,
            1.0,
            1.33,
            2.0,
            2.66,
            4.0,
            5.33,
            8.0,
          ],
      zoomIndexDiscrete: (json['zoomIndexDiscrete'] as num?)?.toInt() ?? 6,
      zoomFreeIndex: (json['zoomFreeIndex'] as num?)?.toDouble() ?? 0.5,
      zoomValue: (json['zoomValue'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$ZoomInfoModelToJson(_ZoomInfoModel instance) =>
    <String, dynamic>{
      'zoomStepsDiscrete': instance.zoomStepsDiscrete,
      'zoomIndexDiscrete': instance.zoomIndexDiscrete,
      'zoomFreeIndex': instance.zoomFreeIndex,
      'zoomValue': instance.zoomValue,
    };
