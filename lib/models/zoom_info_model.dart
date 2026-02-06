import 'package:freezed_annotation/freezed_annotation.dart';

part 'zoom_info_model.freezed.dart';
part 'zoom_info_model.g.dart';

@freezed
abstract class ZoomInfoModel with _$ZoomInfoModel {
  const ZoomInfoModel._();
  const factory ZoomInfoModel({
    @Default([0.125, 0.167, 0.25, 0.33, 0.5, 0.66, 1.0, 1.33, 2.0, 2.66, 4.0, 5.33, 8.0])
    List<double> zoomStepsDiscrete,
    @Default(6) int zoomIndexDiscrete,
    @Default(0.5) double zoomFreeIndex,
    @Default(1.0) double zoomValue,
  }) = _ZoomInfoModel;

  double getZoomMult({int? index}) {
    if (index != null) {
      return index >= zoomStepsDiscrete.length - 1 ? zoomStepsDiscrete.last : zoomStepsDiscrete[index];
    }
    return zoomIndexDiscrete >= zoomStepsDiscrete.length - 1
        ? zoomStepsDiscrete.last
        : zoomStepsDiscrete[zoomIndexDiscrete];
  }

  factory ZoomInfoModel.fromJson(Map<String, dynamic> json) => _$ZoomInfoModelFromJson(json);
}
