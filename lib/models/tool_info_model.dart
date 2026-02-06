import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_info_model.freezed.dart';
part 'tool_info_model.g.dart';

@freezed
abstract class ToolInfoModel with _$ToolInfoModel {
  const factory ToolInfoModel({
    @Default(LineMode.simple) LineMode lineMode,
    @Default(SquareMode.outline) SquareMode squareMode,
    @Default(0) int brushSize,
    @Default(0) int lineDelta,
    @Default(false) bool isEraserSet,
  }) = _ToolInfoModel;

  factory ToolInfoModel.fromJson(Map<String, dynamic> json) => _$ToolInfoModelFromJson(json);
}

enum SquareMode { outline, filled, checker }

enum LineMode { simple, dotted }
