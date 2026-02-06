import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixel_model.g.dart';
part 'pixel_model.freezed.dart';

@freezed
abstract class PixelModel with _$PixelModel {
  const factory PixelModel({@Default(-1) int row, @Default(-1) int column, @Default(0) mySwatchIndex}) = _PixelModel;

  factory PixelModel.fromJson(Map<String, dynamic> json) => _$PixelModelFromJson(json);
}
