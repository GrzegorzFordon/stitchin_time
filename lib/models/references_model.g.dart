// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'references_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferencesModel _$ReferencesModelFromJson(Map<String, dynamic> json) =>
    _ReferencesModel(
      uuid: json['uuid'] as String? ?? "defaultValue",
      references:
          (json['references'] as List<dynamic>?)
              ?.map((e) => ReferenceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      activeIndex: (json['activeIndex'] as num?)?.toInt() ?? 0,
      cachedRefData: json['cachedRefData'] == null
          ? const ReferenceModel()
          : ReferenceModel.fromJson(
              json['cachedRefData'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ReferencesModelToJson(_ReferencesModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'references': instance.references,
      'activeIndex': instance.activeIndex,
      'cachedRefData': instance.cachedRefData,
    };
