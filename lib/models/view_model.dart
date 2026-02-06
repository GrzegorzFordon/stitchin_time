import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stitchin_time/models/zoom_info_model.dart';

part 'view_model.g.dart';
part 'view_model.freezed.dart';

@freezed
abstract class ViewModel with _$ViewModel {
  const factory ViewModel({
    @Default(0) int activeRow,
    @Default(0) int activeCol,
    @Default(true) bool startAtBottom,
    @Default(false) bool isLeftToRight,
    @Default(false) bool isZigZag,
    @Default(25) int fallOff,
    @Default(5) int maxBlockLength,
    @Default(1) int rowRepeats,
    @Default(1) int currentRepeat,
    @Default(ZoomInfoModel()) ZoomInfoModel zoomInfo,
    @Default(false) bool showSettings,
  }) = _ViewModel;

  factory ViewModel.fromJson(Map<String, dynamic> json) => _$ViewModelFromJson(json);
}
