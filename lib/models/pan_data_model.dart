import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stitchin_time/models/pattern_model.dart';

part 'pan_data_model.freezed.dart';
part 'pan_data_model.g.dart';

@freezed
abstract class PanDataModel with _$PanDataModel {
  const PanDataModel._();
  const factory PanDataModel({PatternModel? pattern, @Default(0) int dx, @Default(0) int dy}) = _PanDataModel;

  factory PanDataModel.fromJson(Map<String, dynamic> json) => _$PanDataModelFromJson(json);

  PatternModel getShifted() =>
      pattern != null ? pattern!.shifted(Offset(dx.toDouble(), dy.toDouble())) : PatternModel(pixelMap: {});
}
