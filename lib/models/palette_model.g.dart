// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palette_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaletteModel _$PaletteModelFromJson(Map<String, dynamic> json) =>
    _PaletteModel(
      swatches:
          (json['swatches'] as List<dynamic>?)
              ?.map((e) => SwatchModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [
            SwatchModel(hue: 20.0, sat: 0.2, val: 0.45),
            SwatchModel(hue: 0.0),
            SwatchModel(hue: 120.0),
            SwatchModel(hue: 240.0),
          ],
      activeSwatchIndex: (json['activeSwatchIndex'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$PaletteModelToJson(_PaletteModel instance) =>
    <String, dynamic>{
      'swatches': instance.swatches,
      'activeSwatchIndex': instance.activeSwatchIndex,
    };
