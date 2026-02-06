import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'swatch_model.g.dart';
part 'swatch_model.freezed.dart';

@freezed
abstract class SwatchModel with _$SwatchModel {
  const SwatchModel._();

  const factory SwatchModel({@Default(0.0) hue, @Default(0.3) sat, @Default(0.3) val}) = _SwatchModel;

  factory SwatchModel.fromJson(Map<String, dynamic> json) => _$SwatchModelFromJson(json);

  Color getColor() {
    Color color = HSVColor.fromAHSV(1.0, hue, sat, val).toColor();
    return color;
  }
}
