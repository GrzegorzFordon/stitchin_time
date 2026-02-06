import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stitchin_time/models/pixel_model.dart';

part 'grid_selection_model.g.dart';
part 'grid_selection_model.freezed.dart';

@freezed
abstract class GridSelectionModel with _$GridSelectionModel {
  const factory GridSelectionModel({
    @Default(PixelModel()) PixelModel startPixel,
    @Default(PixelModel()) PixelModel endPixel,
    @Default(false) bool isActive,
  }) = _GridSelectionModel;

  factory GridSelectionModel.fromJson(Map<String, dynamic> json) => _$GridSelectionModelFromJson(json);
}
