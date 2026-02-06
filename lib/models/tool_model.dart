import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_model.freezed.dart';
part 'tool_model.g.dart';

@freezed
abstract class ToolModel with _$ToolModel {
  const factory ToolModel({
    @Default(ToolType.brush) ToolType activeTool,
    @Default(ReferenceType.move) ReferenceType activeReferenceTool,
  }) = _ToolModel;

  factory ToolModel.fromJson(Map<String, dynamic> json) => _$ToolModelFromJson(json);
}

enum ToolType { brush, line, square, reference, select, stamp, fill, pan }

enum ReferenceType { move, rotate, scale }
