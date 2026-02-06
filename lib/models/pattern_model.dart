import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stitchin_time/models/pixel_model.dart';

part 'pattern_model.g.dart';
part 'pattern_model.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class PatternModel with _$PatternModel {
  const PatternModel._();
  const factory PatternModel({@Default({}) Map<String, PixelModel> pixelMap}) = _PatternModel;

  factory PatternModel.fromJson(Map<String, dynamic> json) => _$PatternModelFromJson(json);

  PatternModel operator +(PatternModel other) {
    Map<String, PixelModel> newMap = pixelMap;
    newMap.addAll(other.pixelMap);
    return PatternModel(pixelMap: newMap);
  }

  PatternModel shifted(Offset offset) {
    PatternModel shiftedModel = copyWith(
      pixelMap: pixelMap.map((key, value) {
        (int, int) newCell = ((value.column + offset.dx).toInt(), (value.row + offset.dy).toInt());
        PixelModel newPixel = PixelModel(column: newCell.$1, row: newCell.$2, mySwatchIndex: value.mySwatchIndex);
        return (MapEntry(newCell.toString(), newPixel));
      }),
    );

    return shiftedModel;
  }
}
