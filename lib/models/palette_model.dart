import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stitchin_time/models/swatch_model.dart';

part 'palette_model.g.dart';
part 'palette_model.freezed.dart';

@freezed
abstract class PaletteModel with _$PaletteModel {
  const factory PaletteModel({
    @Default([
      SwatchModel(hue: 20.0, sat: 0.2, val: 0.45),
      SwatchModel(hue: 0.0),
      SwatchModel(hue: 120.0),
      SwatchModel(hue: 240.0),
    ])
    List<SwatchModel> swatches,
    @Default(1) int activeSwatchIndex,
  }) = _PaletteModel;

  factory PaletteModel.fromJson(Map<String, dynamic> json) => _$PaletteModelFromJson(json);
}
